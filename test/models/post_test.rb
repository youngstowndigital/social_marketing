require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:test)
    @twitter_account = twitter_accounts(:test)
    @post = Post.new(title: "test", text: "test", schedule: "Tue, 08 Feb 2022 02:05:00.000000000 UTC +00:00", timezone: "Eastern Time (US & Canada)", user: @user, twitter_account: @twitter_account)
  end

  test "valid save" do
    assert @post.save
  end

  test "validates text" do
    @post.text = ""
    assert_not @post.save
  end

  test "validates title" do
    @post.title = ""
    assert_not @post.save
  end

  test "validates schedule" do
    @post.schedule = ""
    assert_not @post.save
  end

  test "validates timezone" do
    @post.timezone = ""
    assert_not @post.save
  end
end
