require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test)
    @unconfirmed = users(:unconfirmed)
  end

  test "should get new" do
    get login_url
    assert_response :success
  end

  test "successful login" do
    post login_path, params: { session: { email: @user.email, password: 'testpassword' } }
    assert_redirected_to user_path @user
  end

  test "unsuccessful login" do
    post login_path, params: { session: { email: @user.email, password: 'fakepassword' } }
    assert_template :new
    assert_not flash.empty?
  end

  test "unsuccessful login with non existent user" do
    post login_path, params: { session: { email: "fake@email.com", password: "fakepassword" } }
    assert_template :new
    assert_not flash.empty?
  end

  test "unsuccessful login with unconfirmed user" do
    post login_path, params: { session: { email: @unconfirmed.email, password: 'testpassword' } }
    assert_template :new
    assert_not flash.empty?
  end
end
