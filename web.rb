require 'sinatra'
require 'require_all'
require 'sinatra/flash'
require "pry-remote"

require_all "app"

enable :sessions

get "/" do
  erb :index
end

post '/login' do
  if params[:action] == "Log in"


  else

  end
end
