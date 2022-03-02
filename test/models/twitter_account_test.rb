require "test_helper"

class TwitterAccountTest < ActiveSupport::TestCase
  def setup
    @user = users(:test)
    @twitter_account = TwitterAccount.new(access_token: "test", access_token_secret: "test", name: "test", user: @user)
  end

  test "requires valid token and secret" do
    assert_not @twitter_account.save
  end
end
