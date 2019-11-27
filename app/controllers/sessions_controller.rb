class SessionsController < Devise::SessionsController
  include Devise::Controllers::Rememberable
  before_action :after_sign_in_remember_me, only: [:create]

  def create
    super
  end

  def after_sign_in_remember_me
    if current_user.present? && params[:user][:remember] == "on"
      remember_me current_user
    end
  end
end
