require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

get '/gymclasses' do
  @gymclasses = GymClass.all()
  erb(:"gymclasses/index")
end

get '/gymclasses/new' do
  erb(:"gymclasses/new")
end

post '/gymclasses' do
  gymclass = GymClass.new(params)
  gymclass.save
  redirect to ("/gymclasses")
end
