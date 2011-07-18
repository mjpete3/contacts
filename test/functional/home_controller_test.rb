require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = users(:one)
  end
  
  test "should get index" do
    sign_in @user
    get :index
    assert_select "title", "Your Career | Home"
    assert_response :success
  end

  test "should get index with user logout" do
    sign_out @user
    get :index
    assert_select "title", "Your Career | Home"
    assert_response :success
  end
  
end
