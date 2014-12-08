require 'sinatra'
require 'rest_client'

set :bind, '0.0.0.0'

projects = RestClient::Resource.new 'http://' + ENV['OPEN_ASSET_ENDPOINT'] + '/REST/1/Projects',
                                          user: ENV['OPEN_ASSET_USERNAME'],
                                      password: ENV['OPEN_ASSET_PASSWORD']

before do
  content_type 'application/json'
end

get '/projects/:project_number' do
  projects.get( accept: :json, params: { textMatching: 'exact', project_number: params[:project_number] } )
end
get '/projects' do
  projects.get( accept: :json )
end
