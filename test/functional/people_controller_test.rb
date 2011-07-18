require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  include Devise::TestHelpers
    
  setup do
    @user = users(:one)
    @person = people(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "logout user get index redirect signin" do
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
  
  test "should create person" do 
    sign_in @user
    assert_difference('Person.count') do
      post :create, :person => @person.attributes
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "user logout post create redirect signin" do
    sign_out @user
    post :create, :person => @person.attributes
    assert_redirected_to user_session_path
  end

  test "should show person" do
    sign_in @user
    get :show, :id => @person.to_param
    assert_response :success
  end

  test "user logout show user redirect signin" do
    sign_out @user
    get :show, :id => @person.to_param
    assert_redirected_to user_session_path
  end

  test "should get edit" do
    sign_in @user
    get :edit, :id => @person.to_param
    assert_response :success
  end

  test "user logout get edit redirect signin" do
    sign_out @user
    get :edit, :id => @person.to_param
    assert_redirected_to user_session_path
  end

  test "should update person" do
    sign_in @user
    put :update, :id => @person.to_param, :person => @person.attributes
    assert_redirected_to person_path(assigns(:person))
  end

  test "user logout put update redirect signin" do
    sign_out @user
    put :update, :id => @person.to_param, :person => @person.attributes
    assert_redirected_to user_session_path
  end

  test "should destroy person" do
    sign_in @user
    assert_difference('Person.count', -1) do
      delete :destroy, :id => @person.to_param
    end

    assert_redirected_to people_path
  end
  
    test "user logout destroy redirect signin" do
    sign_out @user
    delete :destroy, :id => @person.to_param
    assert_redirected_to user_session_path
  end

end
