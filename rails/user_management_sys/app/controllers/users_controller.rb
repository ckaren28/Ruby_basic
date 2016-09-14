class UsersController < ApplicationController
  def index
      @users = User.all
  end
  def create
       @user = User.new(first_name:params[:first_name], last_name:params[:last_name], email_address:params[:email_address],password:params[:password])
       @user.valid?
       @user.errors
    if @user.errors.any?
        flash[:error] = @user.errors.full_messages
        redirect_to '/users/new'
    else
        @user.save
        redirect_to '/'
    end
  end
  def show
      @user = User.find(params[:id])
  end
  def edit
      @user = User.find(params[:id])
      render 'edit'
  end
  def update
      @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to "/"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end
  def delete
      @user = User.find(params[:id]).destroy
      redirect_to '/'
  end
  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email_address, :password)
  end

end
