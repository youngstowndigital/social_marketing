require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test)
    @post = posts(:test)
  end

  test "posts page requires login" do
    get posts_path
    assert_redirected_to root_path
  end

  test "post page required login" do
    get post_path @post
    assert_redirected_to root_path
  end
end
