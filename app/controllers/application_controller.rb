class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :recaptcha]
    update_attrs = [:username, :email, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :create, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end


end