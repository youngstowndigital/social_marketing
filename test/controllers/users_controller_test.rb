require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test)
  end

  test "user page requires login" do
    get user_path @user
    assert_redirected_to root_path
  end
end
