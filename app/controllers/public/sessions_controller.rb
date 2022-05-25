# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

     # def after_sign_in_path_for(resource_or_scope)
     #  resource_or_scope.is_a?(Public)
     #   public_customer_path(resource)

     # end

     # def after_sign_out_path_for(resource_or_scope)
     #   if resource_or_scope == :public
     #     new_customer_registration
     #   end
     # end
    
  def reject_customer
    @customer = Customer.find_by(name: params[:customer][:email])
    if @customer
      if @@customer.valid_password?(params[:user][:password]) && (@customer.is_deleted == false)
        flash[:alert] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration_path
      else
        flash[:alert] = "項目を入力してください"
      end
    end
  end
  
   def after_sign_in_path_for(resource)
      public_customer_path(resource)
   end

   def after_sign_out_path_for(resource)
      root_path
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :last_name_kana, :email, :first_name, :first_name_kana, :postal_code, :address, :telephone_number])
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
