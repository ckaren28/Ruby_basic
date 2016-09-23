class AddFriendToFriend < ActiveRecord::Migration
  def change
    add_reference :friends, :friend, index: true, foreign_key: true
  end
end
