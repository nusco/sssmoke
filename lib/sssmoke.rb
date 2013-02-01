require 'sssmoke/version'
require 'sinatra/base'
require 'erb'
require 'tilt'

module Sssmoke
  class Base < Sinatra::Base
    get '/*' do
      begin
        url_path = params[:splat].first
        filename = ENV['filename'] || '.'

        if File.directory? filename
          dir = filename
          template = "#{dir}/#{url_path.empty? ? "index" : url_path}.erb"
          return 404 unless File.exist?(template)
          Tilt.new(template).render
        else
          url_path.empty? ? Tilt.new(filename).render : 404
        end
      rescue; [500, "500 - Internal server error"]; end
    end
    
    configure { set :port => 8888 }
    error(404) { [404, "404 - Page not found"] }
  end
end
