class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:index, :create]

  def index
      #   view incoming requests
      @incoming = FriendRequest.where(friend: current_user)
      @outgoing = current_user.friend_requests
    end

  def create
      #   send request
    friend = User.find(params[:id])
    @friend_request = current_user.friend_requests.new(friend: friend)
        if @friend_request.save
            redirect_to '/users'
        else
            flash[:errors] = "Cannot request"
        end
    end



  def update
        # accept request
      @user = User.find(session[:user_id])
      friend = FriendRequest.find(params[:id]).user_id

      a = Friendship.new(user: current_user, friend_id: friend)
      if a.save
          FriendRequest.find(params[:id]).destroy
          redirect_to '/professional_profile'
      else
          render text: "FUCK"
      end



    end

  def destroy
      #   decline request
      @friend_request.destroy
      redirect_to :back
    end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
