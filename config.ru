# my_app.rb
require 'sinatra/base'

class Frontend < Sinatra::Base
  set :views, settings.root
  
  get '/' do
    erb :index
  end
  
  get '/:page' do |page|
    erb page.to_sym
  end
end

run Frontend
