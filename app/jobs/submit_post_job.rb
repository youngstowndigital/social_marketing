class SubmitPostJob < ApplicationJob
  queue_as :default

  def perform(post_id, post_updated_at)
    post = Post.find(post_id)
  
    if post.updated_at == post_updated_at && !post.posted
      post.tweet
      post.posted = true
      post.save
      puts "Post Updated"
    end
  end
end
