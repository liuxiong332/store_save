require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  def user_info
    { name: @user.name, username: @user.username, password: @user.password, password_confirmation: @user.password }
  end

  test "should get index" do
    @request.accept = "application/json"
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    $stdout.puts @response.body
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    delete :destroy, id: @user
    assert_difference('User.count') do
      post :create, user: user_info
    end
    assert_redirected_to user_path(assigns(:user))
  end

  test "create user using json" do
    delete :destroy, id: @user
    @request.accept = "application/json"
    assert_difference("User.count") do
      post :create, {user: user_info}
    end
  end

  test "should show user" do
    @request.accept = "application/json"
    get :show, id: @user
    assert_response :success
    $stdout.puts @response.body
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  # test "should update user" do
  #   patch :update, id: @user, user: user_info
  #   assert_redirected_to user_path(assigns(:user))
  # end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
