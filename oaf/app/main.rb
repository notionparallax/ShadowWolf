require './app/controller.rb'
require './app/data_sources.rb'
require './app/models.rb'
require 'redis'
require 'rest_client'
require 'rack'

redis       =  RedisSource.new Redis.new
oa          =     OASource.new RestClient, ENV['OPEN_ASSET_ENDPOINT']
data_source = DoubleSource.new redis, oa
OAF.set :host, '0.0.0.0'
OAF.set :data_source, data_source
