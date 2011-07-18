require 'test_helper'

class ContactinfosControllerTest < ActionController::TestCase
    include Devise::TestHelpers
    
  setup do
    @user = users(:one)
    @contactinfo = contactinfos(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_redirected_to people_path
  end

  test "user logout index redirect signin" do
    sign_out @user
    get :index
    assert_redirected_to user_session_path
  end

  test "should get new" do
    sign_in @user
    get :new, :id => 1
    assert_select "title", "Your Career | New Phone/Email"
    assert_response :success
  end

  test "user logout get new redirect signin" do
    sign_out @user
    get :new, :id => 1
    assert_redirected_to user_session_path   
  end
  
  test "should create contactinfo" do
    sign_in @user
    assert_difference('Contactinfo.count') do
      post :create, :contactinfo => @contactinfo.attributes
    end

    assert_redirected_to person_path(@contactinfo.people_id)
  end

  test "user logout post create redirect signin" do
      sign_out @user
      post :create, :contactinfo => @contactinfo.attributes
      assert_redirected_to user_session_path
  end
  
  test "should get edit" do
    sign_in @user
    get :edit, :id => @contactinfo.to_param
    assert_response :success
  end

  test "user logout get edir redirect signin" do
      sign_out @user
      get :edit, :id => @contactinfo.to_param
      assert_redirected_to user_session_path
  end
  
  test "should update contactinfo" do
    sign_in @user
    put :update, :id => @contactinfo.to_param, :contactinfo => @contactinfo.attributes
    assert_redirected_to person_path(@contactinfo.people_id)
  end

  test "user logout update redirect signin" do
      sign_out @user
      put :update, :id => @contactinfo.to_param, :contactinfo => @contactinfo.attributes
      assert_redirected_to user_session_path    
  end
  
  test "should destroy contactinfo" do
    sign_in @user
    @people_id = @contactinfo.people_id
    assert_difference('Contactinfo.count', -1) do
      delete :destroy, :id => @contactinfo.to_param
    end

    assert_redirected_to person_path(@people_id)   
  end
  
  test "user logout destroy redirect signin" do
      sign_out @user
      delete :destroy, :id => @contactinfo.to_param
      assert_redirected_to user_session_path  
  end
  
end
