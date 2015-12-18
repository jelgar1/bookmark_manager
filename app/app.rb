ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super session_secret'

  get "/signup" do
    erb :'signup'
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password])
    user.save
    session[:user_id] = user.id
    session[:email] = params[:email]
    redirect '/links'
  end

  get "/links" do
    @email = session[:email]
    @links = Link.all
    erb :'links/index'
  end

  get "/links/new" do
    erb :'links/new'
  end

  post "/links" do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split(', ').each do |tag|
      tag = Tag.create(name: tag)
      link.tags << tag
    end
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:'links/index')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
