class User < ApplicationRecord
    CONFIRMATION_TOKEN_EXPIRATION = 10.minutes
    MAILER_FROM_EMAIL = "no-reply@example.com"

    has_secure_password

    before_save :downcase_email

    has_many :posts
    has_many :twitter_accounts

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true
    validates :name, presence: true,
                     length: { minimum: 5 }

    def confirmed!
        update_columns(confirmed_at: Time.current)
    end

    def generate_confirmation_token
        signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
    end

    def confirmed?
        !confirmed?
    end

    def send_confirmation_email!
        confirmation = generate_confirmation_token
        UserMailer.confirmation(self, confirmation_token)
    end

    private

    def downcase_email
        self.email = email.downcase
    end
end
