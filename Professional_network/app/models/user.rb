class User < ActiveRecord::Base
  has_secure_password
  has_many :friend_requests, dependent: :destroy
  has_many :pending_invites, through: :friend_requests, source: :friend
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true
  validates :description, :presence => true
  validates :password, :presence => true
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end

end
