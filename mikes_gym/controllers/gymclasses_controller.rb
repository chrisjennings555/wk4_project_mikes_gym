require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/gymclass.rb')
also_reload('../models/*')


#INDEX
get '/gymclasses' do
  @gymclasses = GymClass.all()
  erb(:"gymclasses/index")
end

#NEW
get '/gymclasses/new' do
  erb(:"gymclasses/new")
end

#CREATE
post '/gymclasses' do
  gymclass = GymClass.new(params)
  gymclass.save
  redirect to ("/gymclasses")
end

#SHOW
get '/gymclasses/:id' do
  @gymclass = GymClass.find(params['id'])
  erb(:'gymclasses/show')
end

#EDIT
get '/gymclasses/:id/edit' do
  @gymclass = GymClass.find(params['id'])
  erb(:'gymclasses/edit')
end

#UPDATE
post '/gymclasses/:id' do
  gymclass = GymClass.new(params)
  gymclass.update
  redirect to "/gymclasses/#{params['id']}"
end

#DELETE
post 'gymclasses/:id/delete' do
  gymclass = GymClass.find(params['id'])
  gymclass.delete
  redirect to "/gymclasses"
end 
