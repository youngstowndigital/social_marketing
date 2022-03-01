class SubmitPostJob < ApplicationJob
  queue_as :default

  def perform(post_id, post_updated_at)
    configFile = YAML.load(File.open('config.yml').read)
    puts configFile

    post = Post.find(post_id)

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = configFile["twitter"]["consumer_key"]
      config.consumer_secret = configFile["twitter"]["consumer_secret"]
      config.access_token = post.twitter_account.access_token
      config.access_token_secret = post.twitter_account.access_token_secret
    end
  
    if post.updated_at == post_updated_at && !post.posted
      puts "Post Updated"
      client.update(post.text)
      post.posted = true
      post.save
    end
  end
end
