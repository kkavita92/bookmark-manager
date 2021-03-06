ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'


class DatabaseApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/users/new'
  end

  post '/users' do
    User.new(email: params[:email],
             name: params[:name],
             username: params[:username])
    redirect ''
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
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
