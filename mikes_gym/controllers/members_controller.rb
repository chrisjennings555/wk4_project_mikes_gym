require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/members' do
  @members = Member.all()
  erb(:"members/index")
end 
