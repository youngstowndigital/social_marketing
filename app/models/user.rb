class User < ApplicationRecord
    has_many :posts
    has_many :twitter_accounts

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true
    validates :name, presence: true,
                     length: { minimum: 5 }

    has_secure_password
end
