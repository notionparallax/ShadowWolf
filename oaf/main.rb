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
set :projects, mk_resource( 'Projects' )
set :files   , mk_resource( 'Files'    )

before do
  content_type 'application/json'
  headers 'Access-Control-Allow-Origin' => '*',
    'Access-Control-Allow-Methods' => ['OPTIONS', 'PUT'],
    'Access-Control-Allow-Headers' => 'Content-Type'
end

def get_project_image_urls project_number
  projects = settings.projects
  files = settings.files
  # get via oa image url
  project = JSON.parse( projects.get( accept: :json, params: { textMatching: 'exact', code: project_number } ) ).first
  return nil if project.nil?
  oa_id  = project['id']
  images = JSON.parse(    files.get( accept: :json, params: { textMatching: 'exact', project_id: oa_id             } ) )
  return nil if images.empty?
  first_3_image_urls = images.sort { |a,b| b['rank'].to_i <=> a['rank'].to_i }[0..2].map do |image|
    image_sizes = JSON.parse( files["/#{image['id']}/Sizes"].get( accept: :json, params: { file_format: 'jpg' } ) )
    image_closest_to_1500_width = image_sizes.min { |a,b| (1500-a['width'].to_i).abs <=> (1500-b['width'].to_i).abs }
    # construct image url
    [ 'http://',
      ENV['OPEN_ASSET_ENDPOINT'],
      image_closest_to_1500_width['http_root'],
      image_closest_to_1500_width['relative_path']
    ].join
  end
  
  # cache image url
  settings.redis.set project_number, JSON.generate( first_3_image_urls )
  # return image url 
  first_3_image_urls
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
