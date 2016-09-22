class UsersController < ApplicationController
    #  before_filter :authorize
     before_action :require_login, except: [:new, :create]
     before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
    def new
        user = User.new
    end


    def create
        @user = User.new(name:params[:Name], email:params[:Email], password:params[:Password])
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}", :notice => "Signed up!"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end
    end

    def show
      @user = User.find(params[:id])
      @secret = @user.secrets
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.update(params[:id], name:params[:Name], email:params[:Email])
        if @user.save(:validate => false)
             flash[:success] = "User successfully updated"
             redirect_to "/users/#{@user.id}"
        end
    end

    def destroy
        User.find(params[:id]).destroy
        redirect_to '/sessions/new'
    end



  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
