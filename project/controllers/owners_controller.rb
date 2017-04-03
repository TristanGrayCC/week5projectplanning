require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner.rb')

get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

post '/owners/:id/delete' do
  Owner.delete(params[:id])
  redirect to '/owners'
end

get '/owners/:id/update' do
  @owner = Owner.find(params[:id])
  erb (:"owners/update")
end

post '/owners/:id/update' do
  @owner = Owner.new(params)
  @owner.update
  redirect to '/owners'
end
