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

  test 'should get items from storage' do
    user = users(:one)
    item1 = items(:one)
    item2 = items(:two)

    assert_difference('HistoricalRecord.count', 2) do
      put :add_item, {id: @storage, item_id: item1}, {current_user_id: user.id}
      put :add_item, {id: @storage, item_id: item2}, {current_user_id: user.id}
    end
    assert Item.find(item1.id).storage
    assert Item.find(item2.id).storage

    @request.accept = "application/json"
    get :get_items, id: @storage
    assert_equal assigns[:items].length, 2
    body_item = JSON.parse(@response.body)

    assert_equal Set.new(body_item.map) {|item| item["id"]},
      Set.new([item1.id, item2.id])
  end
end
