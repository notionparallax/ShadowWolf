require 'test/unit'
require 'rest_client'
require 'mocha/test_unit'
require './app/data_sources.rb'
require './app/models.rb'

class TestRemoteDataSources < Test::Unit::TestCase
  def setup
    @source = OASource.new RestClient, ENV['OPEN_ASSET_ENDPOINT']
    @asb_pn = 'S0910004'
    @asb_oa_id = '132'
    @asb_picture_oa_id = '33458'
  end
  def teardown
    sleep 2 # let's not spam our own infrastructure
  end
  def test_ping_oa
    `ping -c1 #{ENV['OPEN_ASSET_ENDPOINT']}`
    assert_equal 0, $?.exitstatus
  end
  def test_get_asb_project
    project = @source.get( project: @asb_pn ).first

    assert_equal @asb_oa_id, project.oa_id
  end
  def test_get_asb_files
    files = @source.get image: @asb_oa_id
    file = files.find { |f| f.oa_id == @asb_picture_oa_id }

    assert_not_nil file 
  end
  def test_get_asb_sizes
    sizes = @source.get size: @asb_picture_oa_id
    size = sizes.find { |s| s.oa_id == '7' }

    assert_not_nil size
  end
end
