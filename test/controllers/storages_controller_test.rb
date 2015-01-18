require 'test_helper'

class StoragesControllerTest < ActionController::TestCase
  setup do
    @storage = storages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage" do
    assert_difference('Storage.count') do
      post :create, storage: { title: @storage.title }
    end

    assert_redirected_to storage_path(assigns(:storage))
  end

  test "should show storage" do
    get :show, id: @storage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storage
    assert_response :success
  end

  test "should update storage" do
    patch :update, id: @storage, storage: { title: @storage.title }
    assert_redirected_to storage_path(assigns(:storage))
  end

  test "should destroy storage" do
    assert_difference('Storage.count', -1) do
      delete :destroy, id: @storage
    end

    assert_redirected_to storages_path
  end

  test 'should add item into storage' do
    user = users(:one)
    item = items(:one)
    assert_difference('HistoricalRecord.count') do
      put :add_item, {id: @storage, item_id: item}, {current_user_id: user.id}
    end
    assert Item.find(item.id).storage
  end

  test 'should remove item from storage' do
    user = users(:one)
    item = items(:one)
    assert_difference('HistoricalRecord.count') do
      put :remove_item, {id: @storage, item_id: item}, {current_user_id: user.id}
    end
    assert_not Item.find(item.id).storage
  end
end
