require 'sinatra/base'
require './lib/models/link.rb'

class DatabaseApp < Sinatra::Base

  get '/' do

  end

  get '/links' do
    @links = Link.all
    erb :links
  end

end
