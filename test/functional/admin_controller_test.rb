require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  include Devise::TestHelpers
    
  setup do
    @user = users(:one)
  end
    
  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
  end

  test "user logout get index redirect signin" do
    sign_out @user
    get :index
    assert_redirected_to user_session_path
  end


end
