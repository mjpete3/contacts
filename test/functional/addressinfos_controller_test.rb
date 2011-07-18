require 'test_helper'

class AddressinfosControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = users(:one)
    @addressinfo = addressinfos(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_redirected_to people_path
  end
  
  test "user logged out get index redirect to signin" do
    sign_out @user
    get :index
    assert_redirected_to user_session_path
  end

  test "should get new" do
    sign_in @user
    get :new, :id => 1
    assert_select "title", "Your Career | New Address"
    assert_response :success
  end

  test "user logged out get new redirect to signin" do
    sign_out @user
    get :new, :id => 1
    assert_redirected_to user_session_path
  end

  test "should create addressinfo" do
    sign_in @user
    assert_difference('Addressinfo.count') do
      post :create, :addressinfo => @addressinfo.attributes
    end

    assert_redirected_to person_path(@addressinfo.people_id)
  end
  
  test "user logged out post create redirect to signin" do
    sign_out @user
    post :create, :addressinfo => @addressinfo.attributes
    assert_redirected_to user_session_path
  end

  test "should get edit" do
    sign_in @user
    get :edit, :id => @addressinfo.to_param
    assert_select "title", "Your Career | Edit Address"
    assert_response :success
  end
  
  test "user logout get edit redirect signin" do
    sign_out @user
    get :edit, :id => @addressinfo.to_param
    assert_redirected_to user_session_path
  end

  test "should update addressinfo" do
    sign_in @user
    put :update, :id => @addressinfo.to_param, :addressinfo => @addressinfo.attributes
    assert_redirected_to person_path(@addressinfo.people_id)
  end
  
  test "user logout put update redirect to signin" do
    sign_out @user    
    put :update, :id => @addressinfo.to_param, :addressinfo => @addressinfo.attributes
    assert_redirected_to user_session_path
  end

  test "should destroy addressinfo" do
    sign_in @user
    @people_id = @addressinfo.people_id
    assert_difference('Addressinfo.count', -1) do
      delete :destroy, :id => @addressinfo.to_param
    end

    assert_redirected_to person_path(@people_id)
  end
  
  test "user logout delete should redirect to signin" do
    sign_out @user   
    @people_id = @addressinfo.people_id
    delete :destroy, :id => @addressinfo.to_param
    assert_redirected_to user_session_path
  end
  
end
