class Micropost < ApplicationRecord
  has_many :comments

  belongs_to :user

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true, length:
    {maximum: Settings.micropost.content_max_length}
  validates :title, presence: true, length:
    {maximum: Settings.micropost.title_max_length}
  validate :picture_size

  scope :load_feed, ->(id, following_ids){where "user_id IN (#{following_ids})
    OR user_id = :user_id", following_ids: following_ids, user_id: id}

  private

  def picture_size
    if picture.size > Settings.micropost.picture_size.megabytes
      errors.add :picture, I18n.t(".picture_validate")
    end
  end

end
