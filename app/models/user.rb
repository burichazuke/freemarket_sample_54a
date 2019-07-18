class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :card
  with_options presence: true do
    validates :nickname 
    validates :last_name
    validates :first_name
    validates :last_name_kana 
    validates :first_name_kana 
    validates :birthday
  end

  has_one :address, dependent: :destroy
  has_one :identification, dependent: :destroy
end
