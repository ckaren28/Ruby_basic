class UsersController < ApplicationController
  def index
      @user = User.find(session[:user_id])
      @incoming = FriendRequest.where(friend: current_user)
      @outgoing = current_user.friend_requests
      @friends = @user.friends
    #   @friends = User.where(user:@user).friend
  end

  def all
      @users = User.where.not(id: session[:user_id])
      @friend_request = FriendRequest.pluck(:user_id, :friend_id)
      @incoming = FriendRequest.where(friend: current_user)
      @user = User.find(session[:user_id])
      @friends = @user.friends
      @outgoing = current_user.friend_requests


  end

  def create
      @user = User.new(name:params[:name],description:params[:description], email:params[:email], password:params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/professional_profile"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end
  end

  def show
      @user = User.find(params[:id])

  end

  private
   def user_params
     params.require(:user).permit(:name, :email, :description, :password, :password_confirmation)
   end
end
