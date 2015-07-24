require 'test/unit'
require 'rest_client'
require 'mocha/test_unit'
require './app/data_sources.rb'
require './app/models.rb'

class Example < Model
  def self.from_hash hash
    e = Example.new
    e.oa_id = hash['id']
    [e]
  end
  def to_json options=nil
    { id: @oa_id, example: true }.to_json
  end
end
 
class TestDataSources < Test::Unit::TestCase
  def setup
    @front = DebugSource.new
    @back = DebugSource.new
    @example = Example.from_hash( { 'id' =>  4 } ).first
  end

  if false
  def test_debug_get
    @front.put :example, @example

    result = @front.get example: @example.oa_id

    assert_equal Example, result.first.class
    assert_equal @example.oa_id, result.first.oa_id
  end
  def test_debug_put
    @front.put :example, @example

    assert_not_equal 0, @front.store.count
  end

  def test_double_get_front_ignores_back
    @front.put :example, @example
    @back.expects(:get).never
    @double = DoubleSource.new @front, @back

    result = @double.get example: @example.oa_id

    assert_not_nil result
  end
  def test_double_get_back_tries_front
    @back.put :example, @example
    @front.expects(:get)
          .with(example: @example.oa_id)
          .returns(nil)
          .once
    @double = DoubleSource.new @front, @back

    result = @double.get example: @example.oa_id

    assert_not_nil result
  end
  def test_double_puts_front_if_from_back
    @back.put :example, @example
    @double = DoubleSource.new @front, @back

    result = @double.get example: @example.oa_id

    assert_not_nil result
    assert_not_equal 0, @front.store[:example].count
  end
  end

  def test_redis_get_project
    @redis = Object.new
    expectation = @redis.expects(:get)
          .with('project:1')
          .returns('foo')
          .once
    @source = RedisSource.new @redis

    p = @source.get project: 1

    assert_equal 'foo', p
    assert expectation.verified?
  end
  def test_redis_put_project
    project = Object.new
    project.stubs(:project_number => '4', :to_json => 'foo')
    @redis = Object.new
    expectation = @redis.expects(:set)
          .with('project:4', 'foo')
          .once
    @source = RedisSource.new @redis

    @source.put :project, project

    assert expectation.verified?
  end
  def test_redis_get_image
    @redis = Object.new
    expectation = @redis.expects(:get)
          .with('image:1')
          .returns('foo')
          .once
    @source = RedisSource.new @redis

    p = @source.get image: 1

    assert_equal 'foo', p
    assert expectation.verified?
  end
  def test_redis_put_image
    image = Object.new
    image.stubs(:oa_id => '4', :to_json => 'foo')
    @redis = Object.new
    expectation = @redis.expects(:set)
          .with('image:4', 'foo')
          .once
    @source = RedisSource.new @redis

    @source.put :image, image

    assert expectation.verified?
  end
  def test_redis_get_size
    @redis = Object.new
    expectation = @redis.expects(:get)
          .with('size:1')
          .returns('foo')
          .once
    @source = RedisSource.new @redis

    p = @source.get size: 1

    assert_equal 'foo', p
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

    @source.put :size, size

    assert expectation.verified?
  end
end
