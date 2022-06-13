class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders

  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @cart_item = current_customer.cart_items
    @order.shipping_cost= 800
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
    @cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    @order.save

    @cart_items.each do |f|
     @order_detail = OrderDetail.new

     @order_detail.item_id = f.item_id
     @order_detail.amount = f.amount
     @order_detail.price = f.item.with_tax_price
     @order_detail.making_status = 1
     @order_detail.order_id = @order.id
     @order_detail.save
    end

    @cart = current_customer.cart_items
    @cart.destroy_all

    redirect_to public_orders_complete_path
  end

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = current_customer.addresses
  end

  def show
    @order = Order.find(params[:id])

  end

  def complete
  end

private
  def order_params
    params.require(:order).permit(:customer_id,:shipping_cost, :total_payment, :payment_method ,:status, :postal_code, :address, :name)
  end

end
