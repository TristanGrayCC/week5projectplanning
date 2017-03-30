require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/adoption.rb')
require_relative('../models/owner.rb')
require_relative('../models/animal.rb')

get '/adoptions' do
  @adoptions = Adoption.all
  erb (:"adoptions/index")
end

post '/adoptions/:id/delete' do
  Biting.destroy(params[:id])
  redirect to("/adoptions")
end
