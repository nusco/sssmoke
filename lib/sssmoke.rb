require "sssmoke/version"

module Sssmoke
  FOUR_O_FOUR = [404, "404 - Page not found"]
  require 'sinatra/base'

  class Base < Sinatra::Base
    require 'erb'
    require 'tilt'
    
    def show(template)
      template = "#{template}.erb" unless template.end_with? '.erb'
      File.exist?(template) ? Tilt::ERBTemplate.new(template).render : FOUR_O_FOUR
    end
  end
  
  def self.app
    filename = ARGV.shift || "."

    if File.directory? filename
      Class.new(Sssmoke::Base) do
        set :views, filename
        get('/') { show 'index' }
        get('/:template') {|template| show template }
      end
    else
      Class.new(Sssmoke::Base) do
        get('/') { show filename }
        error(404) { FOUR_O_FOUR }
      end
    end
  end
  
  app.run!
end
