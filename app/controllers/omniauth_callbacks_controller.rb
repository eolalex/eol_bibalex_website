class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def facebook
#     
    # @user = UserProvider.find_for_facebook_oauth(request.env["omniauth.auth"])
    # if @user.persisted?
       # sign_in_and_redirect @user, :event => :authentication
    # else
      # session["devise.facebook_data"] = request.env["omniauth.auth"]
      # redirect_to new_user_registration_url
    # end
  # end
# 
  # def twitter
    # auth = request.env["omniauth.auth"]
    # debugger
    # render 'devise/registrations/email'
    # # @user = UserProvider.find_for_twitter_oauth(request.env["omniauth.auth"])
    # # if @user.persisted?
       # # sign_in_and_redirect @user, :event => :authentication
    # # else
      # # session["devise.twitter_uid"] = request.env["omniauth.auth"]
       # # redirect_to new_user_registration_url
    # # end
  # end
#   
  # def twitter_add_data
# 
    # email = params["value"];
    # auth = params['auth']
    # @user = UserProvider.find_for_twitter_oauth(auth)
    # if @user.persisted?
       # sign_in_and_redirect @user, :event => :authentication
    # else
      # session["devise.twitter_uid"] = auth
       # redirect_to new_user_registration_url
    # end
  # end
  # # def google
    # # debugger
    # # @user = UserProvider.find_for_google_oauth2_oauth(request.env["omniauth.auth"])
    # # if @user.persisted?
      # # sign_in_and_redirect @user, :event => :authentication
    # # else
      # # session["devise.user_attributes"] = user.attributes
      # # redirect_to new_user_registration_url
    # # end
  # # end
#   
  # def google_oauth2
    # @user = UserProvider.find_for_google_oauth2_oauth(request.env["omniauth.auth"])
    # if @user.persisted?
      # # flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      # sign_in_and_redirect @user, :event => :authentication
    # else
      # session["devise.google_data"] = request.env["omniauth.auth"]
      # redirect_to new_user_registration_url
    # end
  # end
  
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
        set_flash_message :error,  :failure, kind: provider,
            reason: I18n.t(:account_not_linked)
      else
        sign_in_and_redirect user, event: :authentication
        flash[:notice] =  I18n.t(:signed_in, scope: 'devise.sessions')
      end
    end
  end
  
end
