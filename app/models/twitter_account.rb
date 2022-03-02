class TwitterAccount < ApplicationRecord
    before_save :validate_tokens
    belongs_to :user
    has_many :posts, dependent: :destroy
    
    validates :name, presence: true
    validates :access_token, presence: true
    validates :access_token_secret, presence: true

    def validate_tokens
        configFile = YAML.load(File.open('config.yml').read)
        begin
            client = Twitter::REST::Client.new do |config|
                config.consumer_key = configFile["twitter"]["consumer_key"]
                config.consumer_secret = configFile["twitter"]["consumer_secret"]
                config.access_token = access_token
                config.access_token_secret = access_token_secret
            end
            client.friends
            true
        rescue Twitter::Error::Forbidden, Twitter::Error::Unauthorized
            false
        end
    end
end
