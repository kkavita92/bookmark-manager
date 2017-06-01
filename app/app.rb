ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './lib/models/link.rb'
require './lib/models/tag.rb'

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
    link = Link.create(name: params[:name], address: params[:address])
    tag = Tag.first_or_create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end


end
