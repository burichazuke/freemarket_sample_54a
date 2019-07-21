class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VERIFICATION_CODE_LENGTH = 6
  attr_accessor :verification_code_confirmation
  validates :phone_number, format: { with: /\A\d{3}-?\d{4}-?\d{4}\z/ }, allow_blank: true
  after_update :issue_verification_code, if: :user_has_verification_code?
  after_update :send_verification_code, unless: :user_verified?

  with_options presence: true do
    validates :nickname 
    validates :last_name
    validates :first_name
    validates :last_name_kana 
    validates :first_name_kana 
    validates :birthday
  end

  has_one :card
  has_one :address, dependent: :destroy
  has_many :comments
  has_one :identification, dependent: :destroy


# sms送信用のメソッド定義
  def verify_and_save(attributes)
    self.assign_attributes(attributes)
    if self.verification_code == self.verification_code_confirmation
      self.verified = true
      self.verification_code = nil
      self.save
    else
      self.errors.add(:verification_code_confirmation)
      false
    end
  end

  def self.not_verified
    where(verified: false)
  end
  
  private
  # todo: after_createになった場合は、下記の記述は必要なし→unless user_verified?に変更
  def user_has_verification_code?
    if self.verification_code.nil? && self.verified == false
      return true
    else
      return false
    end
  end

  def user_verified?
    if self.verified == true
      return true
    else
      return false
    end
  end

  def issue_verification_code
    self.verification_code = VERIFICATION_CODE_LENGTH.times.map{ Random.rand(9) + 1 }.join
    self.save!
  end

  # 080-1234-5678 => # +8180-1234-5678
  def formatted_phone_number
    "+81#{self.phone_number[1..-1]}"
  end

  def send_verification_code
    @twilio_client = Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"])
    @twilio_client.api.account.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: formatted_phone_number,
      body: "この認証コードを入力してください。\n#{verification_code}"
    )
  end
end
