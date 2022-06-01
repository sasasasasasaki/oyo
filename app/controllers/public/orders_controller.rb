class Public::OrdersController < ApplicationController
  def index
  end

  def create
    @oder = Oder.new(oder_params)
    @oder.save
    redirect_to new_public_order_path
  end

  def new
    @customer = current_customer
    @addresses = current_customer.addresses
  end

  def show
  end

  def complete
  end

  def oder_params
    params.require(:oder).permit(:customer_id,:shipping_cost, :total_payment, :payment_method ,:status, :postal_code, :address, :name)
  end

end
