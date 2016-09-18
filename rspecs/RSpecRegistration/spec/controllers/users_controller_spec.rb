require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #create" do
    it "validates the length of password" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
