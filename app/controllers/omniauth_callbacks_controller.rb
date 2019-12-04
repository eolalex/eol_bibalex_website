class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ApplicationHelper

  def facebook
    connect(:facebook)
  end

  def twitter
    connect(:twitter)
  end

  def google_oauth2
    connect(:google)
  end

  def failure
    super
  end

  def connect(provider)
    auth = request.env["omniauth.auth"]
    intent = request.env["omniauth.params"]["intent"]
    user = UserProvider.oauth_user_exists?(auth)
    if intent == "sign_up"
      if user.blank?
        redirect_to new_user_provider_path(info: auth[:info],
          provider: auth[:provider], uid: auth[:uid])
      else
        set_flash_message :notice, :failure, kind: provider,
          reason: I18n.t(:account_already_linked)
        redirect_to new_user_registration_path
      end
    else
      #sign_in
      if user.blank?
        redirect_to new_user_session_path
        set_flash_message :error, :failure, kind: provider,
          reason: I18n.t(:account_not_linked)
      else
        sign_in_and_redirect user, event: :authentication
        flash_msg = I18n.t(:signed_in, scope: 'devise.sessions')
        flash[:notice] = flash_msg
      end
    end
  end
end

