class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]
  validate :password_complexity
  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
  has_and_belongs_to_many :collections
  has_many :open_authentications, dependent: :delete_all
  has_many :content_partners, through: :content_partner_users
  has_many :user_providers, dependent: :destroy
  # has_and_belongs_to_many :roles, join_table: :roles_users
  # has_many :plugins, class_name: "UserPlugin", dependent: :destroy
  # attr_accessible :plugins
  # def username_format
    # return unless username =~ /\s/
    # errors.add :username, 'Invalid Username Format: Username should not contain any blank spaces.'
  # end
  
  searchkick word_start: [:username]
  
  def search_data
    {
      username: username.downcase,
      id: id
    }
  end

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

# def plugins=(plugin_names)
    # if persisted? # don't add plugins when the user_id is nil.
      # UserPlugin.delete_all( user_id: id)
      # plugin_names.each_with_index do |plugin_name, index|
        # plugins.create( name: plugin_name, position: index) if plugin_name.is_a?(String)
      # end
    # end
  # end
# 
  # def authorized_plugins
    # plugins.collect(&:name) | ::Refinery::Plugins.always_allowed.names
  # end
# 
  # def can_delete?(user_to_delete = self)
    # user_to_delete.persisted? &&
      # !user_to_delete.has_role?(:superuser) &&
      # ::Role[:refinery].users.any? &&
      # id != user_to_delete.id
  # end
# 
  # def can_edit?(user_to_edit = self)
    # user_to_edit.persisted? && (
      # user_to_edit == self ||
      # self.has_role?(:superuser)
    # )
  # end
# 
  # def add_role(title)
    # raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(::Role)
    # roles << ::Role[title] unless has_role?(title)
  # end
# 
  # def has_role?(title)
    # raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(::Role)
    # roles.any?{|r| r.title == title.to_s.camelize}
  # end
# 
  # def create_first
    # if valid?
      # # first we need to save user
      # save
      # # add refinery role
      # add_role(:refinery)
      # # add superuser role
      # add_role(:superuser) if ::Role[:refinery].users.count == 1
      # # add plugins
      # self.plugins = Refinery::Plugins.registered.in_menu.names
    # end
# 
    # # return true/false based on validations
    # valid?
  # end
# 

end
