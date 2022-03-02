require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test)
    @post = posts(:test)
    @twitter_account = twitter_accounts(:test)
  end

  test "posts page requires login" do
    get posts_path
    assert_redirected_to root_path
  end

  test "post page required login" do
    get post_path @post
    assert_redirected_to root_path
  end

  test "creating a post requires a login" do
    post posts_path, params: { post: { title: "Test", text: "Test" } }
    assert_redirected_to root_path
  end

  test "navigate to new post page with logged in user" do
    login_user(@user, 'testpassword')
    get posts_path
    assert_response :success
  end

  test "creating a post with logged in user" do
    login_user(@user, 'testpassword')
    assert_difference 'Post.count' do
      post posts_path, params: { post: { title: "Test", text: "Test", schedule: 'Tue, 08 Feb 2022 02:05:00.000000000 UTC +00:00', twitter_account_id: @twitter_account.id } }
    end
    assert_redirected_to posts_path
  end

  test "testing post validation" do
    login_user(@user, 'testpassword')
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { title: "Test", text: "Test", twitter_account_id: @twitter_account.id } }
    end
    assert_template :new
  end
end
