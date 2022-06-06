class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
    
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @cart_item = current_customer.cart_items
    @total = 0

    if Order.payment_methods_i18n[:credit_card]

    else
       Order.payment_methods_i18n[:transfer]
    end

    if params[:order][:address_id] == "address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address_id] == "addresses"
      @address = Address.find(params[:order][:addresses])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_id] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

    end

     #if Order.payment_methods_i18n[:credit_card]
        #Order.payment_methods_i18n[:transfer]
    #@order.postal_code = current_customer.postal_code
    #@order.address = current_customer.address
    #@order.name = current_customer.first_name + current_customer.last_name

  end

  def create
    @cart_item = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    
    @cart_items.each do |f|
     @order_detail = OrderDetail.new
    
     @order_detail.item_id = f.item_id
     @order_detail.item_id = f.order_id
     @order_detail.item_id = f.price
     @order_detail.item_id = f.amount
     @order_detail.item_id = f.making_status
     @order_detail.save
    end
    
    @order.save
    
    redirect_to public_orders_complete_path
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
