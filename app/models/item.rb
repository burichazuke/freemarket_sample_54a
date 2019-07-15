class Item < ApplicationRecord
  
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :images, dependent: :destroy
  # belongs_to_active_hash :category
  # belongs_to_active_hash :brand
  # has_many :comments, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :users, through: :favorites, dependent: :destroy
  
end
