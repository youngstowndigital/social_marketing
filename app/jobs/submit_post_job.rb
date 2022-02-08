class SubmitPostJob < ApplicationJob
  queue_as :default

  def perform(post_id, post_updated_at)
    config = YAML.load(File.open('config.yml').read)
    puts config
    post = Post.find(post_id)
    post.posted = true
    post.save
  end
end
