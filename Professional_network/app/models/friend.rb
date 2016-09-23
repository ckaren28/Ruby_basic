class Friend < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :friendships
  

end
