class Article < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader

  def thumbnail
    return self.avatar.variant(resize: '50x50')
  end
  
end
