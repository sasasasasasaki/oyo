class Admin::OrderDetailsController < ApplicationController
 def update
    @order_details = OrderDetails.new()
  

 private
  def order_details_params
    params.require(:order_details).permit(:order_id,:item_id, :price, :amount ,:making_status, :postal_code, :address, :name)
  end

 end
end
