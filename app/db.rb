require "sequel"
require 'pry-remote'
require 'sinatra'

configure :development do
  DB = Sequel.connect('postgres://localhost:5432/secret_santa')
  set :environment, :development
end


DB.create_table? :logins do
  primary_key :id
  String :name
  String :password
end
