class SecretsController < ApplicationController
    before_action :require_login, only: [:index, :create, :destroy]

  def index
      @secrets= Secret.all
      @user = User.find(session[:user_id])
  end
  def create
      secret = Secret.new(content: secret_params['content'], user:current_user)
      flash["success"] = "Secret added!" if secret.save
      redirect_to :back
  end
  def destroy
      user = session[:user_id]
      secret = Secret.find(params[:id])
      secret.destroy if secret.user == current_user
      redirect_to "/users/#{user}"
    #   redirect_to "/users/#{user.id}"
  end


  private
  def secret_params
      params.require(:secret).permit(:content )
    end
end
