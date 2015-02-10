require 'logger'
require 'sinatra'
require 'rest_client'
require 'redis'

def mk_resource resource
  RestClient::Resource.new 'http://' + ENV['OPEN_ASSET_ENDPOINT'] + '/REST/1/' + resource,
                                 user: ENV['OPEN_ASSET_USERNAME'],
                             password: ENV['OPEN_ASSET_PASSWORD']
end

set :redis, Redis.new
RestClient.log = Logger.new(STDOUT)
set :bind, '0.0.0.0'
Projects = mk_resource( 'Projects' )
Files = mk_resource( 'Files'    )

before do
  content_type 'application/json'
  headers 'Access-Control-Allow-Origin' => '*',
    'Access-Control-Allow-Methods' => ['OPTIONS', 'PUT'],
    'Access-Control-Allow-Headers' => 'Content-Type'
end

def parse_result json
  JSON.parse( json.encode 'utf-8', 'iso-8859-1' )
end

def get_tags description
  description.scan( /\[\[([^\]]*)\]\]/ )
    .map do |top|
      top.map do |bot|
        bot.split(',').map(&:strip) 
      end 
    end.flatten.flatten.uniq
end
def top_3_images images
  (images || []).sort { |a,b|
    b['rank'].to_i <=> a['rank'].to_i 
  }[0..2]
end
def get_image_url image
  image_sizes = parse_result( Files["/#{image['id']}/Sizes"].get( accept: :json, params: { file_format: 'jpg' } ) )
  image_closest_to_1500_width = image_sizes.min { |a,b| (1500-a['width'].to_i).abs <=> (1500-b['width'].to_i).abs }
  # construct image url
  [ 'http://',
    ENV['OPEN_ASSET_ENDPOINT'],
    image_closest_to_1500_width['http_root'],
    image_closest_to_1500_width['relative_path']
  ].join
end

def get_project_image_urls project_number, tags
  # get via oa image url
  project = parse_result( Projects.get( accept: :json, params: { textMatching: 'exact', code: project_number } ) ).first
  return nil if project.nil?
  oa_id  = project['id']
  images = parse_result(    Files.get( accept: :json, params: { textMatching: 'exact', project_id: oa_id, limit: '0' } ) )
  return nil if images.empty?
  if tags.nil?
    images = top_3_images(images).map(&method(:get_image_url))
    settings.redis.set project_number, JSON.generate( first_3_image_urls )
  else
    images_by_tags = images.inject({}) do |hash,image|
      get_tags(image['description']).each do |tag|
        hash[tag] = [] if hash[tag].nil?
        hash[tag] << image 
      end
      hash
    end
    images = tags.inject({}) { |hash,tag| hash[tag] = top_3_images(images_by_tags[tag]).map(&method(:get_image_url)); hash }
    images.each_pair { |tag,image_urls| settings.redis.set project_number + ':' + tag, JSON.generate( image_urls ) }
  end
  
  # cache image url
  # return image url 
  images
end

options '/projects' do
  200
end
put '/projects' do
  project_numbers = JSON.parse request.body.read
  project_image_urls = {}
  project_numbers.each do |project_number|
    image_urls_as_json = settings.redis.get project_number
    if image_urls_as_json.nil? and params[:update_cache].eql? 'true'
      image_urls = get_project_image_urls project_number
    elsif not image_urls_as_json.nil?
      image_urls = JSON.parse image_urls_as_json
    end
    project_image_urls[project_number] = image_urls if image_urls
  end
  project_image_urls.to_json
end

options '/project_by_tags/:project_number' do
  200
end
put '/project_by_tags/:project_number' do
  project_number = params[:project_number]
  tags = JSON.parse request.body.read
  image_urls_by_tags = {}
  tags.each do |tag|
    redis_result = settings.redis.get( project_number + ':' + tag )
    image_urls_by_tags[tag] = parse_result redis_result unless redis_result.nil?
  end
  tags_to_search = tags - image_urls_by_tags.keys
  unless tags_to_search.empty?
    image_urls_by_tags.merge! get_project_image_urls( project_number, tags_to_search )
  end
  image_urls_by_tags.to_json
end
