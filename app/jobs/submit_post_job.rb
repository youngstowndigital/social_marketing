class SubmitPostJob < ApplicationJob
  queue_as :default

  def perform(post_id, post_updated_at)
    configFile = YAML.load(File.open('config.yml').read)
    puts configFile

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = configFile["twitter"]["consumer_key"]
      config.consumer_secret = configFile["twitter"]["consumer_secret"]
      config.access_token = configFile["twitter"]["access_token"]
      config.access_token_secret = configFile["twitter"]["access_token_secret"]
    end

    post = Post.find(post_id)
  
    if post.updated_at == post_updated_at && !post.posted
      puts "Post Updated"
      client.update(post.text)
      post.posted = true
      post.save
    end
  end
end
