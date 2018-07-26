class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]
  validate :username_format, :password_complexity
  validates_confirmation_of :password
  has_and_belongs_to_many :collections
  has_many :open_authentications, dependent: :delete_all
  has_many :content_partners, through: :content_partner_users
  has_many :user_providers, :dependent => :destroy
  
  def username_format
    # return unless username =~ /\s/
    # errors.add :username, 'Invalid Username Format: Username should not contain any blank spaces.'
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    # return if password.present? and not password.match (/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/)
    # errors.add :password, 'Complexity requirement not met. Password should be at least 8 chacracters long and include: 1 Upper case, 1 lower case, 1 digit and 1 special character'
  end

  def can_update?(content_partner)
    # content_partner.user.id == self.id || self.is_admin?
    true
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.info.username
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
