require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'



class BookmarkManager < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
  
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/create_bookmark' do
    Bookmark.create(params[:title], params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    p params
  end

  run! if app_file == $0
end
