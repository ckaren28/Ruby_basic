class InvitesController < ApplicationController
    before_action :set_friend_request, except: [:index, :create]
      def index
        #   view incoming requests
        @incoming = Invite.where(friend: current_user)
        @outgoing = current_user.friend_requests
      end

      def create
        @user = User.find(session[:user_id])
        friend = User.find(params[:id])
        @request = current_user.friend_requests.new(friend: friend)
        if @request.save
            redirect_to :back
        else
            flash[:errors] = "Cannot request"
        end
      end

      def update
        #   accept request
        @friend_request.accept
        redirect_to :back
      end

      def destroy
        @request.destroy
        redirect_to :back
      end

      private
      def set_request
      @request = Invite.find(params[:id])
      end

    end
