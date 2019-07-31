class Item < ApplicationRecord
  before_save :item_profit
  attr_accessor :image_validation, :image_files, :delete_image_files, :parent_id, :child_id

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

  # validates :name, :description, :price, :images, presence: true
  # validates :size, :condition, :shipping_fee, :shipping_method, :prefecture, :shipping_date, presence: true

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :comments, dependent: :destroy

  validates :name, :description, :price, :size, :condition, :shipping_fee, :shipping_method, :prefecture, :shipping_date, presence: true
end



