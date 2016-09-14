require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get generate" do
    get :generate
    assert_response :success
  end

end
