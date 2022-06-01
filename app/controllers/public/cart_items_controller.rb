class Public::CartItemsController < ApplicationController
  def index
    @cart = current_customer.cart_items
    @total = 0
    # @cart_items = current_customer.cart_items.all
  end

  def update

  end

  def destroy
    @cart = CartItem.find(params[:id])
    @cart.destroy
    redirect_to public_cart_items_path
  end
  
  def destroy_all
    @cart = current_customer.cart_items
    @cart.destroy_all
    render 'index'
  end

  def create
       @cart = CartItem.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
       cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       cart_item.amount += params[:cart_item][:amount].to_i

       cart_item.save

    else
      #binding.pry
      @cart.save
    end


    redirect_to public_cart_items_path


    # モデル名。newでストロングパラーメターからデータを入れる（例.book.new（strongparameter））

    #　１で作ったものを。saveで保存ををする

    # redirectで画面を戻す

  end

private

 def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id, :amount, :page )
 end

end
