require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

get '/gymclass' do
  @gymclasses = Gymclass.all
end
