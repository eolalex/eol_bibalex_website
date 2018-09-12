class RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  helper_method :url_without_locale_params
  before_action :set_locale
  before_action :configure_permitted_params, only: [:create, :edit]
  before_action :check_captcha, only: [:create]

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
  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :recaptcha,:failed_attempts)
    end
    devise_parameter_sanitizer.permit(:edit) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  # def after_confirmation_path_for(resource_name, resource)
  # new_session_path(resource_name)
  # end

  def check_captcha
    if verify_recaptcha
    true
    else
      self.resource = User.new(sign_up_params)
      resource.valid?
      resource.errors.add(:recaptcha, I18n.t(:recaptcha_error))
      new_session_path(resource_name)
    end
  end

  def email

  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
