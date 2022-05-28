class Public::CartItemsController < ApplicationController
  def index
  end

  def update

  end
  
  def create
    if my_cart.add_item(product_id: params[:product_id], quantity: params[:quantity])

    end
  end

private

 def cart_items_params
    params.require(:cart_items).permit(:cart_items,:customer_id, :amount, :page)
 end

end
