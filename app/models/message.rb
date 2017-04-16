class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :body_or_image, presence: true

  mount_uploader :image, ImageUploader

  scope :desc, -> { order("created_at DESC") }

  def self.created_after(time)
    where("created_at > ?", time)
  end

  def self.group_no(id)
    where("group_id = ?", id)
  end

  private
  def body_or_image
    body.presence or image.presence
  end
end
