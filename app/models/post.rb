class Post < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :title, presence: true
  validates :text, presence: true
  validates :schedule, presence: true

  scope :has_posted, -> { where(posted: true) }
  scope :pending_post, -> { where(posted: false) }

  def schedule_post
    SubmitPostJob.set(wait_until: schedule).perform_later(id, updated_at)
  end

  def tweet
    configFile = YAML.load(File.open('config.yml').read)
    puts configFile
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = configFile["twitter"]["consumer_key"]
      config.consumer_secret = configFile["twitter"]["consumer_secret"]
      config.access_token = twitter_account.access_token
      config.access_token_secret = twitter_account.access_token_secret
    end

    client.update(text)
  end
end
