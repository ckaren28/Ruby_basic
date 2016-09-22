class CommentsController < ApplicationController

  def create
      user = User.find(session[:user_id])
      event = Event.find(params[:event_id])
      Discussion.create(user:user, event:event, content:params[:comment])
      redirect_to :back
  end
end
