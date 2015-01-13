require 'test_helper'

class AppControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "index test" do
    get :index, nil
    assert_template :index
    assert_not assigns["_current_user"]
  end
end
