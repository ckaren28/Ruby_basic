class EventsController < ApplicationController
  def index
      @user = User.find(session[:user_id])
      @users = User.all
      @events_in_state = Event.where(state: @user.state)
      @events_not_state = Event.where.not(state: @user.state)

  end

  def show
      @event = Event.find(params[:id])
      @users = @event.users
      @count = Attendee.where(event:@event).count
      @comments = Discussion.where(event: @event)

  end

  def create
      user = User.find(session[:user_id])
      event = Event.new(name:params[:name], date:params[:date], location:params[:location], state:params[:state],
      user:user)
      if event.save
          redirect_to '/events'
      else
          flash[:errors]
      redirect_to :back
  end

  end

  def edit
      @user = User.find(session[:user_id])

  end

  def update
  end

  def destroy
      Event.find_by(params[:id]).destroy
      redirect_to :back
  end

  private
  def event_params
      params.require(:event).permit(:name, :date, :location, :state, :user)
  end
end
