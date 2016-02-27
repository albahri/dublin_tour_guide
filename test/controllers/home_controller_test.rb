require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get userspage" do
    get :userspage
    assert_response :success
  end

  test "should get adminspage" do
    get :adminspage
    assert_response :success
  end

end
