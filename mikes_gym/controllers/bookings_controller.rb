require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/booking.rb')
require_relative('../models/gymclass.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/bookings' do
  @bookings = Booking.all()
  erb(:"/bookings/index")
end

get '/bookings/new' do
  @members = Member.all
  @gymclasses = GymClass.all
  erb(:"/bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to ("/bookings")
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'])
  @member_at_booking = @booking.member
  @class_at_booking = @booking.class
  erb(:"/bookings/show")
end

get '/bookings/:id/edit' do
  @members = Member.all
  @gymclasses = GymClass.all
  @booking = Booking.find(params['id'])
  erb(:'/bookings/edit')
end

post '/bookings/:id' do
  booking = Booking.new(params)
  booking.update
  redirect to "/bookings/#{params['id']}"
end

post '/bookings/:id/delete' do
  booking = Booking.find(params['id'])
  booking.delete
  redirect to "/bookings"
end
