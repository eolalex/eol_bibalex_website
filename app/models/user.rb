class User < ApplicationRecord
  has_many :open_authentications, dependent: :delete_all
  has_many :content_partners, through: :content_partner_users
  has_many :user_providers, dependent: :destroy

  has_and_belongs_to_many :collections

  validate :password_complexity
  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable, :confirmable,
     :lockable, :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]

  def password_complexity
    if password.present? and not password.match (/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
      errors.add :password, 'Complexity requirement not met. '\
        'Password should be at least 6 characters long and include: 1 Upper case, 1 lower case, and 1 digit'
    end
  end

  def can_update?(content_partner)
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
