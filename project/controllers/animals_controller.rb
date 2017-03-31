require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')

get '/animals' do
  @animals = Animal.all()
  erb (:"animals/index")
end

post '/animals/:id/delete' do
  Animal.delete(params[:id])
  redirect to '/animals'
end
