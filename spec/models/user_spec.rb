require 'rails_helper'
describe User do
  describe '#create' do

    it "全てのバリデーションをクリアすれば新規登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

  end
end