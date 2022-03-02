require "test_helper"

class TwitterAccountsControllerTest < ActionDispatch::IntegrationTest
  test "twitter accounts page required login" do
    get twitter_accounts_path
    assert_redirected_to root_path
  end

  test "creating a twitter account requires login" do
    post twitter_accounts_path, params: { twitter_account: { access_token: "test", access_token_secret: "test" } }
    assert_redirected_to root_path
  end
end
