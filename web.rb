require 'sinatra'
require 'require_all'

require_all "app"

get "/" do
  erb :index
end
