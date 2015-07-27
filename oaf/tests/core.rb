require 'test/unit'
require 'mocha/test_unit'
require './app/core.rb'

class Example < Model
  def self.from_hash hash
    e = Example.new
    e.oa_id = hash['id']
    e
  end
  def to_json options=nil
    { id: @oa_id, example: true }.to_json
  end
end
 
class TestCore < Test::Unit::TestCase

  def setup
    @model = Example.new
    @data_source = DataSource.new
    @model.data_source( @data_source )
  end
  def teardown
  end
 
  def test_data_source_from_json
    e = @data_source.from_json :example, '[{"id":5}]'
    assert_equal e.first.oa_id, 5
  end
 
  def test_model_get
    @model = Example.new
    @model.oa_id = 5
    @model.data_source( @data_source )
    @data_source.expects(:get)
      .with( example: 5 )
      .returns( id: 5 )
    assert_equal @model.get( :example ), { id: 5 }
  end
end
