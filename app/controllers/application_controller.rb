class ApplicationController < ActionController::Base

  protect_from_forgery prepend: true, with: :exception
  include  Devise::Controllers::StoreLocation
  include Devise::Controllers::Rememberable

  before_action :set_locale_direction
  helper_method :url_without_locale_params
  before_action :allow_cross_domain_ajax
  before_action :store_user_location!, if: :storable_location?
  before_action :set_action_mailer_default_url
  before_action :set_cache_headers

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end

  def set_action_mailer_default_url
   ActionMailer::Base.default_url_options = { host: request.host_with_port}
  end

  def allow_cross_domain_ajax
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = 'POST, OPTIONS'
  end

  def nothing
    render text: '', content_type: 'text/plain'
  end

  def set_locale_direction
    @direction_page = (I18n.locale==:ar)?("rtl"):("ltr")
  end

  protected

  def configure_permitted_params
    # debugger
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :recaptcha, :failed_attempts)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location = stored_location_for(resource_or_scope)
    if ((request.referer.nil?) || (request.referer.include? "/user_providers/"))
      root_path
    elsif (stored_location.include? "_tab?page_id")
      main_app.page_path(stored_location.partition("=").last.to_i)
      else 
        stored_location || super
    end
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
