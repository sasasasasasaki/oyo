class Public::HomesController < ApplicationController
  
 def top
   @new_items = Item.all 
 end
end
