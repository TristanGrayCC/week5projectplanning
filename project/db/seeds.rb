require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
require('pry-byebug')

Adoption.delete_all
Animal.delete_all
Owner.delete_all

animal1 = Animal.new({'profile' => "TBC", 'name' => "Jeremy",'species' => "Pegasus", 'breed' => "Silverback", 'admission_date' => "1408-04-27", 'ready_to_adopt' => "TRUE", 'honour_level' => 7, 'adopted' => "FALSE"})
animal2 = Animal.new({'profile' => "TBC", 'name' => "Sir Lancelot",'species' => "Giant Corgi", 'breed' => "Red Nosed", 'admission_date' => "1463-03-22", 'ready_to_adopt' => "TRUE", 'honour_level' => 4, 'adopted' => "FALSE"})
animal3 = Animal.new({'profile' => "TBC", 'name' => "Radavest",'species' => "Griffin", 'breed' => "Long-Clawed", 'admission_date' => "1422-11-15", 'ready_to_adopt' => "TRUE", 'honour_level' => 9, 'adopted' => "FALSE"})
animal4 = Animal.new({'profile' => "TBC", 'name' => "Polan",'species' => "Griffin", 'breed' => "Long-Clawed", 'admission_date' => "1422-11-15", 'ready_to_adopt' => "TRUE", 'honour_level' => 9, 'adopted' => "FALSE"})
animal5 = Animal.new({'profile' => "TBC", 'name' => "Tom",'species' => "Giant Corgi", 'breed' => "Long-Clawed", 'admission_date' => "1422-11-15", 'ready_to_adopt' => "TRUE", 'honour_level' => 9, 'adopted' => "FALSE"})
animal6 = Animal.new({'profile' => "TBC", 'name' => "Blow Hard",'species' => "Dragon", 'breed' => "Long-Clawed", 'admission_date' => "1422-11-15", 'ready_to_adopt' => "TRUE", 'honour_level' => 9, 'adopted' => "FALSE"})
animal7 = Animal.new({'profile' => "TBC", 'name' => "Raden",'species' => "Griffin", 'breed' => "Long-Clawed", 'admission_date' => "1422-11-15", 'ready_to_adopt' => "TRUE", 'honour_level' => 9, 'adopted' => "FALSE"})
animal8 = Animal.new({'profile' => "TBC", 'name' => "Paw",'species' => "Hippogriff", 'breed' => "Long-Clawed", 'admission_date' => "1422-11-15", 'ready_to_adopt' => "TRUE", 'honour_level' => 9, 'adopted' => "FALSE"})
animal9 = Animal.new({'profile' => "TBC", 'name' => "Inglis",'species' => "Pegasus", 'breed' => "Long-Clawed", 'admission_date' => "1422-11-15", 'ready_to_adopt' => "TRUE", 'honour_level' => 9, 'adopted' => "FALSE"})
animal10 = Animal.new({'profile' => "TBC", 'name' => "Dravin",'species' => "Pegasus", 'breed' => "Long-Clawed", 'admission_date' => "1422-11-15", 'ready_to_adopt' => "TRUE", 'honour_level' => 7, 'adopted' => "FALSE"})

animal1.save
animal2.save
animal3.save
animal4.save
animal5.save
animal6.save
animal7.save
animal8.save
animal9.save
animal10.save

owner1 = Owner.new({'name' => "Sir Rhys the Brave",'profile' => "Welsh", 'address' => "Narnia", 'species_pref' => "Pegasus", 'honour_level' => 8, 'is_dead' => "FALSE"})
owner2 = Owner.new({'name' => "Sir Zsolt the Beast",'profile' => "Hungarian", 'address' => "Hunic Empire", 'species_pref' => "Giant Corgi", 'honour_level' => 5, 'is_dead' => "FALSE"})
owner3 = Owner.new({'name' => "Sir Dominic the Calm",'profile' => "English", 'address' => "Heavenly Vaults", 'species_pref' => "Griffin", 'honour_level' => 10, 'is_dead' => "FALSE"})

owner1.save
owner2.save
owner3.save

adoption1 = Adoption.new({'owner_id' => owner1.id,'animal_id' => animal1.id})

adoption1.save
