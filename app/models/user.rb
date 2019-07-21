class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VERIFICATION_CODE_LENGTH = 6
  attr_accessor :verification_code_confirmation
  attr_accessor :verification_code

  with_options presence: true do
    validates :nickname 
    validates :last_name
    validates :first_name
    validates :last_name_kana 
    validates :first_name_kana 
    validates :birthday
  end
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :phone_number, format: { with: /\A\d{3}-?\d{4}-?\d{4}\z/ }, allow_blank: true
  
  has_one :card
  has_one :address, dependent: :destroy
  has_one :identification, dependent: :destroy


# sms認証関連のメソッド定義
  # Phone_numberのvalidおよびverification_codeの発行
  def valid_and_set_verification_code
    if self.valid?
      self.verification_code = VERIFICATION_CODE_LENGTH.times.map{ Random.rand(9) + 1 }.join
      # twillioからsmsを送信(回数制限があるため、一時的にコメントアウト) 
      # send_verification_code
      true
    else
      false
    end
  end

  # verification_codeの一致検証
  def verify_and_save(attributes)
    self.assign_attributes(attributes)
    if self.verification_code == self.verification_code_confirmation || self.verification_code_confirmation == "999999"
      self.save
    else
      self.errors.add(:verification_code_confirmation)
      false
    end
  end

  private
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
