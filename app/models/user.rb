class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # attr_accessor :username
  # validate :username_format
  # , :password_complexity
  validates_confirmation_of :password

  # def username_format 
    # return unless username =~ /\s/
    # errors.add :username, 'Invalid Username Format: Username should not contain any blank spaces.'
  # end 
#   
  # def password_complexity
    # # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    # return if password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/ 
    # errors.add :password, 'Complexity requirement not met. Length should be 6-128 character and include: 1 Upper case, 1 lower case, 1 digit and 1 special char'
  # end

end
