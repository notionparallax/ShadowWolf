require 'test/unit'
require 'rest_client'
require 'mocha/test_unit'
require './app/data_sources.rb'
require './app/models.rb'

class Example < Model
  def self.from_hash hash
    hash.map do |h|
      e = Example.new
      e.oa_id = h['id']
      e
    end
  end
  def to_json options=nil
    { id: @oa_id, example: true }.to_json
  end
end
 
class TestDataSources < Test::Unit::TestCase
  def setup
    @front = DebugSource.new
    @back = DebugSource.new
    @example = Example.from_hash( [{ 'id' =>  4 }] ).first
  end

  def test_debug_get
    @front.put :example, '2', [@example]

    result = @front.get example: '2'

    assert_equal Example, result.first.class
    assert_equal @example.oa_id, result.first.oa_id
  end
  def test_debug_put
    @front.put :example, '2', [@example]

    assert_not_equal 0, @front.store.count
  end

  def test_double_cache_bust
    @front.put :example, '2', [@example]
    @front.expects(:get).never
    @front.expects(:put)
    @back.expects(:get).returns([])
    @double = DoubleSource.new @front, @back, cache_bust: true

    result = @double.get( example: '2' )
  end
  def test_double_get_front_ignores_back
    @front.put :example, '2', [@example]
    @back.expects(:get).never
    @double = DoubleSource.new @front, @back

    result = @double.get example: '2'

    assert_not_nil result
  end
  def test_double_get_back_tries_front
    @back.put :example, '2', [@example]
    @front.expects(:get)
          .with(example: '2')
          .returns(nil)
          .once
    @double = DoubleSource.new @front, @back

    result = @double.get example: '2'

    assert_not_nil result
  end
  def test_double_puts_front_if_from_back
    @back.put :example, '2', [@example]
    @double = DoubleSource.new @front, @back

    result = @double.get example: '2'

    assert_not_nil result
    assert_not_equal 0, @front.store[:example].count
  end

  def test_redis_put_project
    project = Object.new
    project.stubs(:project_number => '2', :to_json => 'foo')
    @redis = Object.new
    expectation = @redis.expects(:set)
          .with('project:4', 'foo')
          .once
    @source = RedisSource.new @redis

    @source.put :project, '4', project

    assert expectation.verified?
  end
  def test_redis_put_image
    image = Object.new
    image.stubs(:oa_id => '4', :to_json => 'foo')
    @redis = Object.new
    expectation = @redis.expects(:set)
          .with('image:2', 'foo')
          .once
    @source = RedisSource.new @redis

    @source.put :image, '2', image

    assert expectation.verified?
  end
  def test_redis_get
    @redis = Object.new
    expectation = @redis.expects(:get)
          .with('example:1')
          .returns('[{"id":"4"}]')
          .once
    @source = RedisSource.new @redis

    p = @source.get example: 1

    assert_kind_of Array, p
    assert_equal '4', p.first.oa_id
    assert expectation.verified?
  end
  def test_redis_put_size
    size = Object.new
    size.stubs(:oa_id => '4', :to_json => 'foo')
    @redis = Object.new
    expectation = @redis.expects(:set)
          .with('size:4', 'foo')
          .once
    @source = RedisSource.new @redis

    @source.put :size, '4', size

    assert expectation.verified?
  end
end
