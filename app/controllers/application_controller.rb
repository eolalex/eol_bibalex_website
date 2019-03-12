class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery
  include  Devise::Controllers::StoreLocation

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :set_locale_direction
  helper_method :url_without_locale_params
  before_action :allow_cross_domain_ajax
  before_action :store_user_location!, if: :storable_location?

  def allow_cross_domain_ajax
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = 'POST, OPTIONS'
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def nothing
    render text: '', content_type: 'text/plain'
  end

  def set_locale_direction
    @direction_page = (I18n.locale==:ar)?("rtl"):("ltr")
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :recaptcha]
    update_attrs = [:username, :email, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :create, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if current_user
      request.referrer
    else
    # root_path
      new_user_session_url
    end
  end

end