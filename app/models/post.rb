class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :text, presence: true
  validates :schedule, presence: true
end
