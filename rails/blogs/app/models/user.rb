class User < ActiveRecord::Base
    has_many :messages, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :owners, dependent: :destroy
    has_many :blogs, :through => :owners
    has_many :comments, :as => :commentable 
    has_many :blogs, through: :posts
    validates :first_name, :last_name, :email, presence: true
    validates :first_name, length: { minimum: 2 }
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
