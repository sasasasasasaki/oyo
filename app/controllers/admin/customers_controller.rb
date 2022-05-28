class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
    flash[:alert] = "編集完了"

    else
      render :edit
    end
  end

  def show
    @customers = Customer.all
    @customer = Customer.find_by(id: params[:id])
  end

private

  def customer_params
   params.require(:customer).permit(:last_name, :last_name_kana, :email, :first_name, :first_name_kana, :postal_code, :address, :telephone_number,:page,:is_deleted)
  end

end
