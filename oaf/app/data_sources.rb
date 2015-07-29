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
  def put collection, id, obj
    @store[collection] ||= {}
    @store[collection][id] = obj.to_json
  end
end
class DoubleSource < DataSource
  def initialize front, back, cache_bust=false
    @front = front
    @back = back
    @cache_bust = cache_bust
  end
  def get query
    result = @front.get query unless @cache_bust
    if result.nil?
      result = @back.get query
      collection,id = query.keys.first,query.values.first
      @front.put collection, id, result
    end
    result.map { |r| r.data_source self }
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
    result = @redis.get( query_str )
    from_json key, result.encode( 'utf-8', 'iso-8859-1' ) unless result.nil?
  end
  def put collection, id, obj
    key = "#{collection}:#{id}"
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
