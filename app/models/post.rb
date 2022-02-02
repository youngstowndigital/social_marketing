class Post < ApplicationRecord
  belongs_to :user

  validates :text, presence: true
  validates :schedule, presence: true
end
