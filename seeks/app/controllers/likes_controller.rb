class LikesController < ApplicationController
  def create
      user = session[:user_id]
      secret = Secret.find(params[:secret_id])
      Like.create(user: current_user, secret: secret)
      redirect_to :back
  end
  def destroy
      user = User.find(session[:user_id]).id
      secret = Secret.find(params[:id]).id
      like = Like.find_by(user: user, secret:secret)
      like.destroy
      redirect_to :back
  end
end
