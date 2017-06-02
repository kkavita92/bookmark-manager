ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

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
    params[:tag].split(' ').each do |tag|
      link.tags << Tag.first_or_create(name: tag)
      link.save
    end
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:links)
  end


end
