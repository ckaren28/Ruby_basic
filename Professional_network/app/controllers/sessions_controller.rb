class SessionsController < ApplicationController
    def new
        @users = User.all
        render :new
    end

    def create
        user = User.find_by(email: params[:Email])

      if user && user.authenticate(params[:Password])
        session[:user_id] = user.id
        redirect_to "/professional_profile"
      else
        flash[:errors] = ["Invalid password"]
        redirect_to "/main"
      end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/main', :notice => "Logged out"
      end
end
