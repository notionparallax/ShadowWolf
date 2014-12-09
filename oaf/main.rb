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
end

def get_project_image_url project_number
  projects = settings.projects
  files = settings.files
  # get via oa image url
  oa_id = JSON.parse( projects.get( accept: :json, params: { textMatching: 'exact', code: params[:project_number] } ) ).first['id']
  images = JSON.parse( files.get( accept: :json, params: { textMatching: 'exact', project_id: oa_id } ) )
  return nil if images.empty?
  first_image_sizes = JSON.parse( files["/#{images.first['id']}/Sizes"].get( accept: :json, params: { file_format: 'jpg' } ) )
  image_closest_to_200_width = first_image_sizes.min { |a,b| (200-a['width'].to_i).abs <=> (200-b['width'].to_i).abs }
  
  # construct image url
  image_url = ['http://',
    ENV['OPEN_ASSET_ENDPOINT'],
    image_closest_to_200_width['http_root'],
    image_closest_to_200_width['relative_path']
  ].join
  # cache image url
  settings.redis.set project_number, image_url
  # return image url 
  image_url
end

get '/projects/:project_number' do
  project_image_url = settings.redis.get params[:project_number]
  if not project_image_url
    project_image_url = get_project_image_url params[:project_number]
  end
  project_image_url
end
put '/projects' do
  project_numbers = JSON.parse request.body.read
  project_image_urls = {}
  project_numbers.each do |project_number|
    image_url = settings.redis.get project_number
    if image_url.nil? and params[:update_cache].eql? 'true'
      image_url = get_project_image_url project_number
    end
    project_image_urls[project_number] = image_url if image_url
  end
  project_image_urls.to_json
end
