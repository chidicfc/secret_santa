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
  view = LoginView.new params[:name], params[:password]
  controller = LoginController.new view
  unless controller.isUser?
    session[:login] = view
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
    @view = UserView.new session[:login].name
    @controller = UserController.new @view
    @controller.play_secret_santa
    while @view.name == session[:login].name do
      @controller.play_secret_santa
    end
    LoginController.new.delete session[:login]
    @controller.delete @view
    session.clear
    erb :result
  else
    flash[:error] = "Unauthorised access"
    redirect "/"
  end
end

get '/logout' do
  session.clear
  redirect "/"
end
