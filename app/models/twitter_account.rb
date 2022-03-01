class TwitterAccount < ApplicationRecord
    belongs_to :user
    has_many :posts, dependent: :destroy
    
    validates :name, presence: true
    validates :access_token, presence: true
    validates :access_token_secret, presence: true
end
