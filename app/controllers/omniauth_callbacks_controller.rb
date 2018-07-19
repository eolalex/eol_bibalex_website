class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    
    @user = UserProvider.find_for_facebook_oauth(request.env["omniauth.auth"])
    # @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
       sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    auth = request.env["omniauth.auth"]

    @user = UserProvider.find_for_twitter_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  # def google
    # debugger
    # @user = UserProvider.find_for_google_oauth2_oauth(request.env["omniauth.auth"])
    # if @user.persisted?
      # sign_in_and_redirect @user, :event => :authentication
    # else
      # session["devise.user_attributes"] = user.attributes
      # redirect_to new_user_registration_url
    # end
  # end
  def google_oauth2
    @user = UserProvider.find_for_google_oauth2_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      # flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
