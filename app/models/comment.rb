class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :content, presence: true, length:
    {maximum: Settings.micropost.content_max_length}
end
