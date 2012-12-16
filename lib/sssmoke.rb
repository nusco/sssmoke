require 'sssmoke/version'
require 'sinatra/base'
require 'erb'
require 'tilt'

class String
  def is_under?(dir)
    File.absolute_path(self).start_with? File.absolute_path(dir)
  end
end

module Sssmoke
  class Base < Sinatra::Base
    get '/*' do
      url_path = params[:splat].first
      filename = ARGV[0] || '.'

      if File.directory? filename
        dir = filename
        template = "#{dir}/#{url_path.empty? ? "index" : url_path}.erb"
        return 404 unless File.exist?(template) and template.is_under?(filename)
        Tilt.new(template).render
      else
        url_path.empty? ? Tilt.new(filename).render : 404
      end
    end

    error(404) { [404, "404 - Page not found"] }
  end
end
