require "sequel"
require 'pry-remote'
require 'sinatra'

configure :development do
  DB = Sequel.connect('postgres://localhost:5432/secret_santa')
  set :environment, :development
end


DB.create_table? :users do
  primary_key :id
  String :name
  String :password
end

class DataBaseDataStore

  def check user
    DB[:users].where(:name => user.name, :password => user.password).all.empty?
  end

end
