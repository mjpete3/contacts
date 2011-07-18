require 'test_helper'

class ContacttypesControllerTest < ActionController::TestCase
    include Devise::TestHelpers
    
  setup do
    @user = users(:one)
    @contacttype = contacttypes(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:contacttypes)
  end
  
  test "user logout get index redirect signin" do
    sign_out @user
    get :index
    assert_redirected_to user_session_path     
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "user logout get new redirect signin" do
    sign_out @user
    get :new
    assert_redirected_to user_session_path     
  end
  
  test "should create contacttype" do
    sign_in @user
    assert_difference('Contacttype.count') do
      post :create, :contacttype => @contacttype.attributes
    end

    assert_redirected_to contacttypes_path
  end

  test "user logout post create redirect signin" do
    sign_out @user
    post :create, :contacttype => @contacttype.attributes
    assert_redirected_to user_session_path     
  end

  test "should get edit" do
    sign_in @user
    get :edit, :id => @contacttype.to_param
    assert_response :success
  end

  test "user logout get edit redirect signin" do
    sign_out @user
    get :edit, :id => @contacttype.to_param
    assert_redirected_to user_session_path     
  end

  test "should update contacttype" do
    sign_in @user
    put :update, :id => @contacttype.to_param, :contacttype => @contacttype.attributes
    assert_redirected_to contacttypes_path
  end
  
  test "user logout put update redirect signin" do
    sign_out @user
    put :update, :id => @contacttype.to_param, :contacttype => @contacttype.attributes
    assert_redirected_to user_session_path     
  end  

  test "should destroy contacttype" do
    sign_in @user
    assert_difference('Contacttype.count', -1) do
      delete :destroy, :id => @contacttype.to_param
    end

    assert_redirected_to contacttypes_path
  end
  
  test "user logout destroy redirect signin" do
    sign_out @user
    delete :destroy, :id => @contacttype.to_param
    assert_redirected_to user_session_path     
  end    
end
