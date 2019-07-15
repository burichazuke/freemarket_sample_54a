class Address < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture
end
