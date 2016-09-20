class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret 

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :presence => true

  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }

  validates :password, :presence => true

#   def self.authenticate(username_or_email="", login_password="")
#   if  EMAIL_REGEX.match(username_or_email)
#     user = User.find_by_email(username_or_email)
#   else
#     user = User.find_by_username(username_or_email)
#   end
#   if user && user.match_password(login_password)
#     return user
#   else
#     return false
#   end
# end
# def match_password(login_password="")
#   encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
# end
end
