class AtendeesController < ApplicationController
  def create
      user = User.find(session[:user_id])
      event = Event.find(params[:id])
      Attendee.create(user: user, event:event)
      redirect_to '/events'
  end

  def destroy
      user = User.find(session[:user_id])
      event = Event.find(params[:id])
      Attendee.find_by(user:user, event:event).destroy
      redirect_to '/events'
  end
end
