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
  
  if params[:name].empty? || params[:password].empty?
    flash[:error] = "Name or Password should not be empty"
    redirect '/'
  else

  end

end
