class Blog < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    has_many :owners, dependent: :destroy
    has_many :comments, :as => :commentable

    validates :name, :description, presence: true
end
