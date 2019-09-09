class Article < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :content, presence: true
  # validates :user_id, presence: true
end
