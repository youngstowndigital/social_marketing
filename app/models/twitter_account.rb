class TwitterAccount < ApplicationRecord
    belongs_to :user
    
    validates :name, presence: true
    validates :access_token, presence: true
    validates :access_token_secret, presence: true
end
