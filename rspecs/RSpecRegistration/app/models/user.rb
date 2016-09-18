class User < ActiveRecord::Base
    has_secure_password
	validates_length_of :password, :minimum => 6

	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => true }

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :password, :presence => true
end
