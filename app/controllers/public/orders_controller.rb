class Public::OrdersController < ApplicationController
  def index
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_id] == "address"
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:address_id] =="addresses"

    elsif params[:order][:address_id] == "new_address"

    end
    @cart_item = current_customer.cart_items
     #if Order.payment_methods_i18n[:credit_card]
        #Order.payment_methods_i18n[:transfer]
    #@order.postal_code = current_customer.postal_code
    #@order.address = current_customer.address
    #@order.name = current_customer.first_name + current_customer.last_name

  end

  def create
    @order = Order.new(oder_params)
    @order.save
    redirect_to confirm_public_orders_path method :POST
  end

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = current_customer.addresses
  end

  def show
  end

  def complete
  end

private
  def order_params
    params.require(:order).permit(:customer_id,:shipping_cost, :total_payment, :payment_method ,:status, :postal_code, :address, :name)
  end

end
