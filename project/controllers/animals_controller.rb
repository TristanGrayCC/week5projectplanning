require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')

get '/animals' do
  @animals = Animal.all()
  erb (:"animals/index")
end

get '/animals/new' do
  erb (:"animals/new")
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  redirect to '/animals'
end

post '/animals/:id/delete' do
  Animal.delete(params[:id])
  redirect to '/animals'
end

get '/animals/:id/update' do
  @animal = Animal.find(params[:id])
  erb (:"animals/update")
end

post '/animals/:id/update' do
  @animal = Animal.new(params)
  @animal.update
  redirect to '/animals'
end
