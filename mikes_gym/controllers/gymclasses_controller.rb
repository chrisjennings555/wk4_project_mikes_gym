require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

get '/gymclasses' do
  @gymclasses = GymClass.all()
  erb(:"gymclasses/index")
end
