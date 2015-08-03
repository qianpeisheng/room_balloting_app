class Room < ActiveRecord::Base
   has_many :users
   
   def chooseThis(name)
      update_attribute(:resident, name)
      #code
   end
    
end
