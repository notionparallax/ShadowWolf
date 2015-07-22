require 'test/unit'
require 'mocha/test_unit'
require './app/models.rb'

class TestModels < Test::Unit::TestCase
  # see http://help.openasset.com/06_Integration/REST_API#Resources
  def setup
  end
  def teardown
  end

  def test_project_from_hash
    hash = {
      'code' => 'blah',
      'id' => 'whoop',
      'name' => 'it does not even matter'
    }
    p = Project.from_hash( [hash] ).first
    assert_equal 'blah', p.project_number
    assert_equal p.oa_id, 'whoop'
    assert_equal p.name, 'it does not even matter'
  end
  def test_project_to_json
    # The purpose of this test is to specify in code
    # what json values OAF returns.
    p = Project.new
    d = DataSource.new
    p.data_source d
    p.oa_id = 'wazzahp'
    p.project_number = 'blah'
    p.name = 'blah blah'
    hash = {
      oa_id: 'wazzahp',
      name: 'blah blah',
      project_number: 'blah'
    }
    d.expects(:get).with(image: 'wazzahp').returns([])

    p_json = JSON.parse p.to_json

    assert_equal hash[:oa_id], p_json['oa_id']
    assert_equal hash[:name], p_json['name']
    assert_equal hash[:project_number], p_json['project_number']
  end
  def test_projects_sort_images_by_tag
    p = Project.new
    d = DataSource.new
    p.data_source d
    d.stubs(:get).returns([
      Image.new, Image.new, Image.new
    ])
    p.images[0].stubs(:tags_with_rank)
               .returns([ ['something', 4],
                          ['otherthing', 2],
                          ['main', 8] ])
    p.images[1].stubs(:tags_with_rank)
               .returns([ ['something', 5],
                          ['main', 6] ])
    p.images[2].stubs(:tags_with_rank)
               .returns([ ['something', 6],
                          ['otherthing', 1],
                          ['main', 9] ])

    assert_equal p.images[0], p.images_by_tag('otherthing')[0]
    assert_equal p.images[2], p.images_by_tag('something')[0]
    assert_equal p.images[2], p.images_by_tag('main')[0]
    assert_equal p.images[0], p.images_by_tag('main')[1]
  end

  def test_image_from_hash
    hash = {
#      'access_level' => '4',
      'caption' => 'a beautiful sunset',
#      'copyright_holder_id' => '3',
      'created' => 'yesterday',
      'description' => 'an ugly sunrise',
      'filename' => 'moon.jpg',
      'id' => '2',
      'original_filename' => 'pluto.png',
#      'photographer_id' => '1',
#      'user_id' => '0',
      'rank' => '11'
    }
    i = Image.from_hash( [hash] ).first
    assert_equal i.caption, hash['caption']
    assert_equal i.created_at, hash['created']
    assert_equal i.description, hash['description']
    assert_equal i.filename, hash['filename']
    assert_equal i.oa_id, hash['id']
    assert_equal i.original_filename, hash['original_filename']
    assert_equal i.rank, hash['rank'].to_i
  end
  def test_image_to_json
    i = Image.new
    d = DataSource.new
    i.data_source d
    i.oa_id = 'wazzahp'
    i.caption = 'caption'
    i.created_at = 'whenever'
    i.description = 'blah [[blah, something-2]]'
    i.filename = 'blah blah'
    i.original_filename = 'blah blah'
    i.rank = 0
    hash = {
      oa_id: 'wazzahp',
      caption: 'caption',
      created_at: 'whenever',
      description: 'blah [[blah, something-2]]',
      filename: 'blah blah',
      original_filename: 'blah blah',
      rank: 0,
      tags: {
        blah: 0,
        something: 2
      }
    }
    d.expects(:get).with(size: 'wazzahp').returns([])

    i_json = JSON.parse i.to_json

    assert_equal hash[:oa_id], i_json['oa_id']
    assert_equal hash[:caption], i_json['caption']
    assert_equal hash[:created_at], i_json['created_at']
    assert_equal hash[:description], i_json['description']
    assert_equal hash[:filename], i_json['filename']
    assert_equal hash[:original_filename], i_json['original_filename']
    assert_equal hash[:rank], i_json['rank']
    assert_equal hash[:tags][:blah], i_json['tags']['blah']
    assert_equal hash[:tags][:something], i_json['tags']['something']
  end
  def test_image_get_tags
    i = Image.new
    i.description = "blah [[blah]]"
    assert_equal %w(blah), i.tags

    i.description = "blah [[blah, blah]]"
    assert_equal %w(blah), i.tags

    i.description = "blah [[something, blah]]"
    assert_equal %w(something blah), i.tags
  end
  def test_image_tags_by_rank
    i = Image.new
    i.rank = 4
    i.description = "blah [[blah-0]]"
    assert_equal ['blah',0], i.tags_with_rank.first

    i.description = "blah [[blah-3, blah-2]]"
    assert_equal [['blah',3]], i.tags_with_rank

    i.description = "blah [[something-10, blah]]"
    assert_equal [['something',10],['blah',4]], i.tags_with_rank
  end

  def test_size_to_json
    i = Size.new
    d = DataSource.new
    i.data_source d
    i.oa_id = 'wazzahp'
    i.width =  80
    i.height = 80
    i.relative_path = 'wherever'
    i.http_relative_path = 'likewise'
    i.http_root = 'somewhere else'
    i.unc_root = 'meh to the eh'
    hash = {
      oa_id: 'wazzahp',
      width:  80,
      height: 80,
      relative_path: 'wherever',
      http_relative_path: 'likewise',
      http_root: 'somewhere else',
      unc_root: 'meh to the eh',
      url: "http://#{ENV['OPEN_ASSET_ENDPOINT']}somewhere elsewherever"
    }

    i_json = JSON.parse i.to_json

    hash.keys
        .each { |key| assert_equal hash[key], i_json[key.to_s] }
  end
  def test_size_from_hash
    hash = {
      'relative_path' => 'wherever',
      'http_relative_path' => 'likewise',
      'http_root' => 'somewhere else',
      'unc_root' => 'meh to the eh'
    }

    i = Size.from_hash( [hash.merge({
      'id' => 'wazzahp',
      'width' =>  '80',
      'height' => '80'
    })] ).first

    hash.keys
        .each { |key| assert_equal hash[key], i.send(key) }
    assert_equal 'wazzahp', i.oa_id
    assert_equal 80, i.width
    assert_equal 80, i.height
  end
  def test_get_image_size_index
    # Small        240     144
    # Square       80      80
    # Thumbnail    120     72
    # Web_View     600     360
    # Medium       1500    900
    # Original     3000    1800
    i = Image.new
    d = DataSource.new
    i.data_source d
    d.stubs(:get).returns([
      Size.new, Size.new, Size.new,
      Size.new, Size.new
    ])
    i.sizes[0].width  = 80
    i.sizes[0].height = 80

    i.sizes[1].width  = 80
    i.sizes[1].height = 120

    i.sizes[2].width  = 160
    i.sizes[2].height = 240

    i.sizes[3].width  = 400
    i.sizes[3].height = 600

    i.sizes[4].width  = 750
    i.sizes[4].height = 1125

    assert_equal i.sizes[0], i[:square]
    assert_equal i.sizes[1], i[:thumbnail]
    assert_equal i.sizes[2], i[:small]
    assert_equal i.sizes[3], i[:web_view]
    assert_equal i.sizes[4], i[:medium]
  end
  def test_size_url
    s = Size.new
    s.http_root = '/blah/'
    s.relative_path = 'blah_blah.jpg'

    url = s.url

    assert_equal "http://#{ENV['OPEN_ASSET_ENDPOINT']}/blah/blah_blah.jpg", url
  end
 
end
