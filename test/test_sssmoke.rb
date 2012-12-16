require 'sssmoke'
require 'test/unit'
require 'rack/test'

ARGV.clear

class SssmokeTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sssmoke::Base
  end

  def teardown
    ARGV.clear
  end
end

class RenderFileTest < SssmokeTest
  def setup
    ARGV << "test/data/simple.erb"
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

class RenderDirectoryTest < SssmokeTest
  def setup
    ARGV << 'test/data/'
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
    assert_equal 'Index file', last_response.body
  end
  
  def test_404
    get '/unknown'
    assert_equal 404, last_response.status
    assert_equal '404 - Page not found', last_response.body
  end
end

class SecurityTest < SssmokeTest
  def test_hide_external_folders
    ARGV << 'test/data/subdir'
    get '/../simple'
    assert_equal 404, last_response.status
  end
end
