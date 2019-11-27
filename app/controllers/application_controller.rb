class ApplicationController < ActionController::Base
  include  Devise::Controllers::StoreLocation
  include Devise::Controllers::Rememberable
  protect_from_forgery prepend: true, with: :exception
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

  protected

    def configure_permitted_params
      # debugger
      devise_parameter_sanitizer.permit(:sign_up) do |user|
        user.permit(:username, :email, :password, :password_confirmation, :recaptcha, :failed_attempts)
      end
      devise_parameter_sanitizer.permit(:account_update) do |user|
        user.permit(:username, :email, :password, :password_confirmation, :current_password)
      end
    end

    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      if request.fullpath.include? "_tab?page_id"
        store_location_for(:user, main_app.page_path(request.fullpath.partition("=").last.to_i))
      else
        store_location_for(:user, request.fullpath)
      end
    end

    def after_sign_in_path_for(resource_or_scope)
      if (request.referer.nil?) || (request.referer.include? "/user_providers/")
        root_path
      else
        stored_location_for(resource_or_scope) || super
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      if current_user
        request.referrer
      else
        new_user_session_url
      end
    end
end

