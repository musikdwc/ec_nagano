class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resouces)
		if customer_signed_in?
	      	customers_path(current_customer)
		else
			admins_customers_path
	    end
 	end

 	def after_sign_out_path_for(resource)
     	if resource == :customer
			new_customer_session_path
		else
			new_admin_session_path
	    end
	 end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :lastkana, :firstkana, :telephone_number, :postal_code, :address, :email, :password, :customer_status])
    devise_parameter_sanitizer.permit(:account_update, keys: [:lastname, :firstname, :lastkana, :firstkana, :telephone_number, :postal_code, :address, :email, :password, :customer_status])
  end

end