require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
require('pry-byebug')

Adoption.delete_all
Animal.delete_all
Owner.delete_all

animal1 = Animal.new({'profile' => "TBC", 'name' => "Jeremy",'species' => "Griffon", 'breed' => "Silverback", 'admission_date' => "1408-04-27", 'ready_to_adopt' => "TRUE", 'honour_level' => 7})

animal1.save

owner1 = Owner.new({'name' => "Sir Rhyss the Brave",'profile' => "Irish", 'address' => "Narnia", 'species_pref' => "Griffon", 'honour_level' => 8})

owner1.save

adoption1 = Adoption.new({'owner_id' => owner1.id,'animal_id' => animal1.id, 'review' => "Fell off, 6/10"})

adoption1.save
