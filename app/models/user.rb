class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VERIFICATION_CODE_LENGTH = 6
  attr_accessor :verification_code_confirmation
  # validates :phone_number, format: { with: /^\d{3}-?\d{4}-?\d{4}$/ }, allow_blank: true
  after_create :issue_verification_code
  after_create :send_verification_code

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

  def issue_verification_code
    self.verification_code = VERIFICATION_CODE_LENGTH.times.map{ Random.rand(9) + 1 }.join
    self.save!
  end

  def twilio_client
    @twilio_client ||= Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]
  end

  # 080-1234-5678 => # +8180-1234-5678
  def formatted_phone_number
    "+81#{self.phone_number[1..-1]}"
  end

  def send_verification_code
    twilio_client.account.sms.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: formatted_phone_number,
      body: "この認証コードを入力してください。\n#{verification_code}"
    )
  end
end
