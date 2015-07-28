require 'test/unit'
require 'mocha/test_unit'
require 'rack/test'
require './app/controller.rb'

class ControllerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    OAF
  end

  class O
  end
  def setup
    app.set :redis, Object.new
    app.set :oa, Object.new
    app.set :data_source, O
  end

  def test_data_source_sets_cache_bust
    ds      = Object.new
    ds.stubs(:get).with(project: '1').returns(nil)

    e = O.expects(:new).with(app.settings.redis, app.settings.oa, true).returns(ds).once
    get '/1/main/0/web_view?cache_bust=true'
    assert e.verified?

    e = O.expects(:new).with(app.settings.redis, app.settings.oa, false).returns(ds).once
    get '/1/main/0/web_view'
    assert e.verified?
#
    e = O.expects(:new).with(app.settings.redis, app.settings.oa, true).returns(ds).once
    get '/1.json?cache_bust=true'
    assert e.verified?

    e = O.expects(:new).with(app.settings.redis, app.settings.oa, false).returns(ds).once
    get '/1.json'
    assert e.verified?

  end
  def test_redirect_303s_on_success
    size    = Object.new ;    size.stubs(:url => 'foo')
    image   = Object.new ;   image.stubs(:[] => size)
    project = Object.new ; project.stubs(images_by_tag: [image])
    ds      = Object.new ;      ds.stubs(:get).with(project: '1').returns([project])
    O.stubs(:new).returns(ds)

    get '/1/main/0/web_view'

    assert_equal 303, last_response.status
    assert_equal 'foo', last_response.headers['Location']
  end
  def test_redirect_404s_on_no_project
    ds      = Object.new ;      ds.stubs(:get).with(project: '1').returns(nil)
    O.stubs(:new).returns(ds)

    get '/1/main/0/web_view'

    assert_equal 404, last_response.status
    assert_equal 'No project found with project number: "1".', last_response.body
  end
  def test_redirect_404s_on_no_images
    project = Object.new ; project.stubs(images_by_tag: [])
    ds      = Object.new ;      ds.stubs(:get).with(project: '1').returns([project])
    O.stubs(:new).returns(ds)

    get '/1/main/0/web_view'

    assert_equal 404, last_response.status
    assert_equal 'No images found with tag: "main".', last_response.body
  end
  def test_redirect_400s_on_negative_integer_index
    project = Object.new ; project.stubs(images_by_tag: [])
    app.settings.data_source.stubs(:get).with(project: '1').returns([project])

    get '/1/main/-1/web_view'

    assert_equal 400, last_response.status
    assert_equal 'Image index must be positive integer (-1 provided).', last_response.body
  end
  def test_redirect_404s_invalid_index
    project = Object.new ; project.stubs(images_by_tag: [nil])
    app.settings.data_source.stubs(:get).with(project: '1').returns([project])

    get '/1/main/1/web_view'

    assert_equal 404, last_response.status
    assert_equal 'No image at index: 1.', last_response.body
  end
  def test_redirect_400s_on_invalid_size
    image   = Object.new ;   image.stubs(:[] => nil)
    project = Object.new ; project.stubs(images_by_tag: [image])
    app.settings.data_source.stubs(:get).with(project: '1').returns([project])

    get '/1/main/0/something_improper'

    assert_equal 400, last_response.status
    assert_equal 'Size must be one of: square, thumbnail, small, web_view, medium.', last_response.body
  end
  def test_redirect_404s_on_absent_size
    image   = Object.new ;   image.stubs(:[] => nil)
    project = Object.new ; project.stubs(images_by_tag: [image])
    ds      = Object.new ;      ds.stubs(:get)
                                  .with(project: '1')
                                  .returns([project])
    O.stubs(:new).returns(ds)

    get '/1/main/0/web_view'

    assert_equal 404, last_response.status
    assert_equal 'The requested size was not available.', last_response.body
  end

  def test_options_on_json_route
    options '/1.json'

    assert_equal 200, last_response.status
  end
  def test_json_200_json_on_success
    project = Object.new ; project.stubs(images_by_tag: [])
                           project.stubs(to_json: 'foo')
    ds      = Object.new ;      ds.stubs(:get)
                                  .with(project: '1')
                                  .returns([project])
    O.stubs(:new).returns(ds)

    get '/1.json'

    assert_equal   200, last_response.status
    assert_equal '[foo]', last_response.body
    assert_equal 'application/json', last_response.headers['Content-Type']
  end
  def test_json_404s_on_no_project
    ds      = Object.new ;      ds.stubs(:get)
                                  .with(project: '1')
                                  .returns(nil)
    O.stubs(:new).returns(ds)

    get '/1.json'

    assert_equal    404, last_response.status
    assert_equal '{}', last_response.body
    assert_equal 'application/json', last_response.headers['Content-Type']
  end
end
