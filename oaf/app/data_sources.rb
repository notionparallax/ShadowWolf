require './app/core.rb'
require 'json'
class DebugSource < DataSource
  attr_accessor :store
  def initialize
    @store = {}
  end
  def get query
    sym, id = query.keys.first, query.values.first
    from_json sym, @store[sym][id] if @store[sym] and @store[sym][id]
  end
  def put collection, obj
    @store[collection] ||= {}
    @store[collection][obj.oa_id] = obj.to_json
  end
end
class DoubleSource < DataSource
  def initialize front, back
    @front = front
    @back = back
  end
  def get query
    result = @front.get query
    if result.nil?
      result = @back.get query
      collection = query.keys.first
      result.each { |res| @front.put collection, res }
    end
    result
  end
end
class RedisSource < DataSource
  def initialize redis
    @redis = redis
  end
  def get query
    key,val = query.keys.first, query.values.first
    query_str = "#{key}:#{val}"
    @redis.get query_str
  end
  def put collection, obj
    key = if collection.eql? :project
            "#{collection}:#{obj.project_number}"
          else
            "#{collection}:#{obj.oa_id}"
          end
    @redis.set key, obj.to_json
  end
end
class OASource < DataSource
  def initialize rest_client, base_url
    @base_url = base_url
    @rest_client = rest_client
  end
  def get query
    key,val = query.keys.first, query.values.first

    result = case key
    when :project
      _get 'Projects', {
        textMatching: 'exact',
        code: val 
      }
    when :image
      _get 'Files', {
        textMatching: 'exact',
        project_id: val,
        contains_video: 0,
        contains_audio: 0,
        limit: '0'
      }
    when :size
      _get "Files/#{val}/Sizes", { file_format: 'jpg' }
    end

    from_json key, result.encode( 'utf-8', 'iso-8859-1' )
  end
  private
  def _get resource_url, params
    username = ENV['OPEN_ASSET_USERNAME']
    password = ENV['OPEN_ASSET_PASSWORD']
    url = 'http://' + username + ':' + password + '@' + @base_url + '/REST/1/' + resource_url
    @rest_client.get( url, params: params )
  end
end
