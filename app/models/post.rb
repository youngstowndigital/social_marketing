class Post < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :title, presence: true
  validates :text, presence: true
  validates :schedule, presence: true

  def schedule_post
    SubmitPostJob.set(wait_until: schedule).perform_later(id, updated_at)
  end
end
