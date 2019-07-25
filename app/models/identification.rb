class Identification < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\Z/ }
end
