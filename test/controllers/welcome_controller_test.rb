require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "should redirect to login page without authentication" do
    get :index
    assert_redirected_to new_user_session_path
  end

  test "should get index with authentication" do
    sign_in(users(:teacher))
    get :index
    assert_response :success
  end
end
