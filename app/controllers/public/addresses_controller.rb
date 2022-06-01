class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    @address.destroy
    redirect_to public_addresses_path
  end

  def edit
    @address = Address.find(params[:id])

  end

  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
    redirect_to public_addresses_path
    flash[:alert] = "編集完了"

    else
      render :edit
    end
  end

private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
