class RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  helper_method :url_without_locale_params
  before_action :configure_permitted_params
  before_action :check_captcha, only: [:create]
  after_action :set_updated_at, only: [:create]

  def set_updated_at
    $updated_at = DateTime.now().strftime("%Q")
  end

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:username, :email, :password, :password_confirmation, :recaptcha, :failed_attempts)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end

  def update_resource(resource, params)
    if resource.provider.nil?
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end

  def check_captcha
    unless verify_recaptcha
      self.resource = User.new(sign_up_params)
      resource.valid?
      resource.errors.add(:recaptcha, I18n.t(:recaptcha_error))
      redirect_to new_user_registration_path
    end
  end

  def email
  end
end
