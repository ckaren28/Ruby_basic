class LikesController < ApplicationController
    before_action :require_login
    # before_action :require_correct_user
  def create
    #   user = User.find(session[:user_id]).id
      secret = Secret.find(params[:secret_id])
      like = Like.new(user: current_user, secret: secret)
      puts current_user.inspect
      puts session[:user_id]
      if  current_user.id != session[:user_id]
          redirect_to "users/#{session[:user_id]}"
      else
          like.save
          redirect_to '/secrets'
      end
  end
  def destroy
      user = User.find(session[:user_id]).id
      secret = Secret.find(params[:id]).id
      like = Like.find_by(user: user, secret:secret)
      if like.destroy
          redirect_to '/secrets'
      else
          redirect_to "users/#{session[:user_id]}"

      end
  end
end
