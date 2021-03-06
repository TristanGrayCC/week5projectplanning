require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/adoption.rb')
require_relative('../models/owner.rb')
require_relative('../models/animal.rb')
require ('pry-byebug')

get '/adoptions' do
  @adoptions = Adoption.all
  erb (:"adoptions/index")
end

get '/adoptions/new' do
  @owners = Owner.all
  @animals = Animal.all
  erb (:"adoptions/new")
end

get '/adoptions/new2' do
  @owner = Owner.find(params['owner_id'])
  @animals = Animal.all
  erb (:"adoptions/new2")
end

post '/adoptions' do
  @adoption = Adoption.new(params)
  result = @adoption.honour(params['owner_id'],params['animal_id'])
  if result == true
    @owner = Owner.find(@adoption.owner_id)
    @animal = Animal.find(@adoption.animal_id)
    @owner.death
    Adoption.delete_by_owner(@adoption.owner_id)
    erb(:"adoptions/death", :layout => :death_layout)
  else
    @adoption.save
    @adoptions = Adoption.all
    erb(:"adoptions/index")
  end
end

post '/adoptions/:id/delete' do
  Adoption.delete(params[:id])
  redirect to '/adoptions'
end
