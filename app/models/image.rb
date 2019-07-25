class Image < ApplicationRecord
  belongs_to :item, foreign_key: "item_id"
  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
