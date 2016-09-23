class FriendsController < ApplicationController
  def destroy
     current_user.remove_friend(@friend)
     redirect_to :back
 end

end
