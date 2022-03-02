require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "tester@test.com", name: "tester", password: "testpassword", password_confirmation: "testpassword")
  end

  test "valid save" do
    assert @user.save
  end

  test "validates email" do
    @user.email = ""
    assert_not @user.save
  end

  test "validates name" do
    @user.name = ""
    assert_not @user.save
  end
end
