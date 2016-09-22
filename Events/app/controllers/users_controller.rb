class UsersController < ApplicationController
  def create
    @user = User.new(first_name:params[:first_name],last_name:params[:last_name],location:params[:location],state:params[:state], email:params[:email], password:params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/events"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end
  end

  def edit
      @user = User.find(session[:user_id])
      @users = User.all

  end

  def update
      @user = User.update(params[:id], first_name:params[:first_name],last_name:params[:last_name],location:params[:location],state:params[:state], email:params[:email])
        if @user.save(:validate => false)
             flash[:success] = "User successfully updated"
             redirect_to "/events"
        end
  end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :location, :password, :password_confirmation)
    end
end
