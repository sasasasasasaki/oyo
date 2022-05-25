class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find_by(id: params[:id])


  end

  def edit
    @customer = Customer.find(params[:id])

  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
    flash[:alert] = "編集完了"

    else
      render :edit
    end
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def index
    @customer = current_customer
  end


private

  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :email, :first_name, :first_name_kana, :postal_code, :address, :telephone_number,:page)
  end
end
