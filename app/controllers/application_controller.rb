class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :firstname, :lastkana, :firstkana, :telephone_number, :postal_code, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :firstname, :lastkana, :firstkana, :telephone_number, :postal_code, :address])
  end
end
