require "test_helper"

class TwitterAccountsControllerTest < ActionDispatch::IntegrationTest
  test "twitter accounts page required login" do
    get twitter_accounts_path
    assert_redirected_to root_path
  end
end
