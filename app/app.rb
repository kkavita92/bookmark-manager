ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './lib/models/link.rb'

class DatabaseApp < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb(:new_link)
  end

  post '/links' do
    Link.create(name: params[:name], address: params[:address])
    redirect '/links'
  end


end
