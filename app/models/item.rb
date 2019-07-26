class Item < ApplicationRecord
  before_save :item_profit
  attr_accessor :image_validation, :image_files, :parent_id, :child_id

  def item_profit
    self.profit = price * 0.9
  end

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :images, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :images
  # belongs_to_active_hash :category

  # belongs_to_active_hash :brand
  has_many :comments, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :users, through: :favorites, dependent: :destroy

  validates :image_validation, :name, :description, :price, :size, :condition, :shipping_fee, :shipping_method, :prefecture, :shipping_date, presence: true
end



