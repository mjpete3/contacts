require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all

  setup do
    @user = users(:one)
  end

  test "a new user registration" do
      get "/users/sign_up"
      assert_response :success
      assert_select "title", "Your Career | Register"
      public_menu_displayed 
            
      post_via_redirect "/users", 
        :commit => "Confirm",
        :user => {:email => "someone@comcast.net", 
                  :password => "scuba1",
                  :password_confirmation => "scuba1"}
     
     private_menu_displayed
     
  end
  
  
end
