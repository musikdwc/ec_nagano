# frozen_string_literal: true

class Customers::RegistrationsController < Devise::RegistrationsController
     # before_action :set_customer, only: [:show, :destroy, :customer_status]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
    def update
    @customer = current_customer
    @customer.update(customer_params)
        redirect_to controller: :customers, action: :show
    end
    def cancel
    @customer = current_customer
    end
  #   def customer_status
  #   @customer.customer_status!
  #   redirect_to @customer, notice: 'successfully updated.'
  # end

  # private
    # Use callbacks to share common setup or constraints between actions.
    # def set_customer
      # @customer = Customer.find(params[:id].to_i || params[:customer_id])
    # end
    # def customer_params
    # params.require(:customer).permit(:lastname, :firstname, :lastkana, :firstkana, :telephone_number, :postal_code, :address, :email)
    # end
end
