require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  before do
      @user = create_user
      @asecret = @user.secrets.create(content: "secret")
      @like = @user.likes.create(user:@user, secret:@asecret)
      session[:user_id] = @user.id
    end
  describe "when not logged in" do
      before do
        session[:user_id] = nil
      end

      it 'cannot like' do
      post :create
      expect(response).to redirect_to('/sessions/new')
    end

    it "cannot unlike" do
      delete :destroy, id: @like
    end
  end

  describe "when signed in as the wrong user" do
      before do
        @wrong_user = create_user 'julius', 'julius@lakers.com'
        @secret = @user.secrets.create(content: 'yoyoy')

      end

      it "will only let the right user create a like" do
          current_user = @wrong_user
          post :create, secret_id: @asecret.id
          expect(response).to redirect_to("/users/#{@wrong_user.id}")
      end
  end
end
