require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = users(:one)
    @note = notes(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
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

  test "should create note" do
    sign_in @user
    assert_difference('Note.count') do
      post :create, :note => @note.attributes
    end

    assert_redirected_to note_path(assigns(:note))
  end

  test "user logout post create redirect signin" do
    sign_out @user
    post :create, :note => @note.attributes
    assert_redirected_to user_session_path
  end

  test "should show note" do
    sign_in @user
    get :show, :id => @note.to_param
    assert_response :success
  end
  
  test "user logout get show redirect signin" do
    sign_out @user
    get :show, :id => @note.to_param
    assert_redirected_to user_session_path
  end

  test "should get edit" do
    sign_in @user
    get :edit, :id => @note.to_param
    assert_response :success
  end

  test "user logout get edit redirect signin" do
    sign_out @user
    get :edit, :id => @note.to_param
    assert_redirected_to user_session_path
  end

  test "should update note" do
    sign_in @user
    put :update, :id => @note.to_param, :note => @note.attributes
    assert_redirected_to note_path(assigns(:note))
  end

  test "user logout put update redirect signin" do
    sign_out @user
    put :update, :id => @note.to_param, :note => @note.attributes
    assert_redirected_to user_session_path
  end
  
  test "should destroy note" do
    sign_in @user
    assert_difference('Note.count', -1) do
      delete :destroy, :id => @note.to_param
    end

    assert_redirected_to notes_path
  end
  
  test "user logout destroy redirect signin" do
    sign_out @user
    delete :destroy, :id => @note.to_param
    assert_redirected_to user_session_path
  end
end
