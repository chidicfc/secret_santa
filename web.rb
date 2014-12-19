require 'sinatra'
require 'require_all'
require 'sinatra/flash'

require_all "app"

get "/" do
  erb :index
end
