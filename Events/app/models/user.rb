class User < ActiveRecord::Base
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :events, through: :attendees, dependent: :destroy


  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :last_name, :first_name, :location, :presence => true

  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }

  validates :password, :presence => true
end
