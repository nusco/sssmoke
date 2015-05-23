require 'sssmoke'
require 'minitest/autorun'
require 'rack/test'

class SssmokeTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sssmoke::Base
  end

  def teardown
    ENV['filename'] = nil
  end
  
  def test_keep_rbx_happy; end # or else it will break under Rubinius
end

class RenderFileTest < SssmokeTest
  def setup
    ENV['filename'] = "test/data/simple.erb"
  end
  
  def test_render_root
    get '/'
    assert_equal 'Simple page', last_response.body
  end
  
  def test_disable_routes
    get '/time'
    assert_equal 404, last_response.status
    assert_equal '404 - Page not found', last_response.body
  end
end

class RenderFolderTest < SssmokeTest
  def setup
    ENV['filename'] = 'test/data/'
  end
  
  def test_render_file
    get '/simple'
    assert_equal 'Simple page', last_response.body
  end

  def test_render_file_in_folder
    get '/subdir/file'
    assert_equal 'File in folder', last_response.body
  end

  def test_render_index
    get '/'
    assert_equal 'Index page', last_response.body
  end
  
  def test_404
    get '/unknown'
    assert_equal 404, last_response.status
    assert_equal '404 - Page not found', last_response.body
  end
end

class RenderDefaultFolderTest < SssmokeTest
  def test_default_folder
    ENV['filename'] = nil
    get '/test/data/simple'
    assert_equal 'Simple page', last_response.body
  end
end

class SecurityTest < SssmokeTest
  def test_hide_external_folders
    ENV['filename'] = 'test/data/subdir'
    get '/../simple'
    assert_equal 404, last_response.status
  end
  
  def test_hide_exceptions
    ENV['filename'] = 'test/data/'
    get '/error'
    assert_equal 500, last_response.status
    assert_equal '500 - Internal server error', last_response.body
  end
end
