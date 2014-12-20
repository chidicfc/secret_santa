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
    session[:authenticated] = true
    redirect "/secret-santa"
  else
    flash[:error] = "Unauthorised access"
    redirect "/"
  end
end

get '/secret-santa' do
  if session[:authenticated]
    erb :secret_santa
  else
    flash[:error] = "Unauthorised access"
    redirect "/"
  end
end

post '/secret-santa' do
  if session[:authenticated]
    @view = SecretSantaView.new
    @controller = SecretSantaController.new @view
    @controller.play_secret_santa session[:user]
    session.clear
    erb :result
  else
    flash[:error] = "Unauthorised access"
    redirect "/"
  end
end

get '/logout' do
  redirect "/"
end
