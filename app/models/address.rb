class Address < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :prefecture, :municipalities, :address, presence: true
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\Z/ }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
end
