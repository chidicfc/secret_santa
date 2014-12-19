require 'sinatra'
require 'require_all'
require 'sinatra/flash'
require "pry-remote"

require_all "app"

enable :sessions

get '/' do
  erb :index
end

post '/login' do

  view = UserView.new params[:name], params[:password]
  controller = UserController.new view
  unless controller.isUser?
    session[:user] = view
    redirect "/secret-santa"
  else
    flash[:error] = "Unauthorised access"
    redirect "/"
  end
end

get '/secret-santa' do
  erb :secret_santa
end
