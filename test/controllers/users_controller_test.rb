require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test)
    @other_user = users(:other)
  end

  test "user page requires login" do
    get user_path @user
    assert_redirected_to root_path
  end

  test "get user page when logged in" do
    login_user(@user, 'testpassword')
    get user_path @user
    assert_response :success
  end

  test "get user page requires the correct user logged in" do
    login_user(@other_user, 'testpassword')
    get user_path @user
    assert_redirected_to root_path
  end
end
