require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test)
  end

  test "should get home" do
    get root_url
    assert_response :success
  end

  test "home should redirect to user page when user logged in" do
    login_user(@user, 'testpassword')
    get root_url
    assert_redirected_to @user
  end
end
