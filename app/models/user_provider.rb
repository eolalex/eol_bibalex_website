class UserProvider < ApplicationRecord
  belongs_to :user
   # def self.find_for_facebook_oauth(auth)
# 
        # user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
        # unless user.nil?
            # user.user
        # else
            # registered_user = User.where(:email => auth.info.email).first
            # unless registered_user.nil?
                        # UserProvider.create!(
                              # provider: auth.provider,
                              # uid: auth.uid,
                              # user_id: registered_user.id
                              # )
                # registered_user
            # else
                # user = User.new(
                    # username: auth.info.name,
                            # email: auth.info.email,
                            # password: Devise.friendly_token[0,20],
                            # provider:auth.provider,
                            # uid:auth.uid
                            # # confirmed_at: Time.now
                            # )
               # user.skip_confirmation!
               # user.save
               # user
                # user_provider = UserProvider.create!(
                    # provider:auth.provider,
                            # uid:auth.uid,
                              # user_id: user.id
                    # )
                # user
            # end
        # end
    # end
# 
    # def self.find_for_google_oauth2_oauth(auth)
        # user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
        # unless user.nil?
            # user.user
        # else
            # registered_user = User.where(:email => auth.info.email).first
            # unless registered_user.nil?
                        # UserProvider.create!(
                              # provider: auth.provider,
                              # uid: auth.uid,
                              # user_id: registered_user.id
                              # )
                # registered_user
            # else
                # user = User.create!(
                    # username: auth.info.name,
                              # email: auth.info.email,
                              # password: Devise.friendly_token[0,20],
                              # provider:auth.provider,
                              # uid:auth.uid,
                              # confirmed_at: Time.now
                            # )
                # user_provider = UserProvider.create!(
                    # provider:auth.provider,
                            # uid:auth.uid,
                            # user_id: user.id
#                             
                    # )
                # user
            # end
        # end
    # end
# 
    # def self.find_for_twitter_oauth(auth)
          # debugger
          # user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
          # unless user.nil?
                # user.user
          # else
                # registered_user = User.where(:username => auth.info.nickname).first
              # unless registered_user.nil?
                        # UserProvider.create!(
                              # provider: auth.provider,
                              # uid: auth.uid,
                              # user_id: registered_user.id
                              # )
                   # registered_user
              # else
                # # render "devise/registrations/email"
                # # ApplicationController.new.render_to_string(
                # # :template => 'devise/registrations/email'
                # # :layout => 'my_layout',
                # # :locals => { :@users => @users }
              # # )
                # user = User.create!(
                        # # name: auth.extra.raw_info.name,
                          # username: auth.info.nickname,                      
                          # password: Devise.friendly_token[0,20],
                          # email:"aaa@yahoo.com",
                          # provider:auth.provider,
                          # uid:auth.uid,
                          # confirmed_at: Time.now
                          # )
# 
                    # user_provider = UserProvider.create!(
                        # provider:auth.provider,
                          # uid:auth.uid,
                          # user_id: user.id
                        # )
                    # user
              # end
# 
        # end
    # end
    
  def self.oauth_user_exists?(auth)
    oauth_user = where(provider: auth.provider, uid: auth.uid).last
    user = User.find_by_id(oauth_user.user_id) if oauth_user
  end
end
