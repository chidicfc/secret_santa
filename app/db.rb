require "sequel"
require 'pry-remote'
require 'sinatra'

configure :development do
  DB = Sequel.connect('postgres://localhost:5432/secret_santa')
  set :environment, :development
end

configure :production do
  DB = Sequel.connect('postgres://fsztkkadegulcc:7s33H7Ajn0Rq9b5lHbUzhtvmvv@ec2-54-235-76-206.compute-1.amazonaws.com:5432/ddelo4rm6e49aj')
  set :environment, :production
end


DB.create_table? :users do
  primary_key :id
  String :name
end

DB.create_table? :logins do
  primary_key :id
  String :name
  String :password
end

class DataBaseDataStore

  def check login
    DB[:logins].where(:name => login.name, :password => login.password).all.empty?
  end

  def play_secret_santa
    names = []
    DB[:users].each do |user_row|
      user_object = User.from_hash(user_row)
      names << user_object.name
    end
    names
    names.sample
  end

  def delete user
    DB[:users].where(:name => user.name).delete
  end

  def delete_login login
    DB[:logins].where(:name => login.name, :password => login.password).delete
  end

end
