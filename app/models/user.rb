class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]
  validate :password_complexity
  validates_confirmation_of :password
  validates :email,presence: true, :uniqueness => true
  has_and_belongs_to_many :collections
  has_many :open_authentications, dependent: :delete_all
  has_many :content_partners, through: :content_partner_users
  has_many :user_providers, :dependent => :destroy
  
  # def username_format
    # return unless username =~ /\s/
    # errors.add :username, 'Invalid Username Format: Username should not contain any blank spaces.'
  # end

  def password_complexity
    if password.present? and not password.match (/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
      errors.add :password, 'Complexity requirement not met. Password should be at least 6 characters long and include: 1 Upper case, 1 lower case, and 1 digit'
    end
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
