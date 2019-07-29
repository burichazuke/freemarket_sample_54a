require 'rails_helper'
describe User do
  describe '#create' do

    it "全てのバリデーションをクリアすれば新規登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームが空なら登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが空なら登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードが空なら登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードが５文字以下なら登録できない" do
      user = build(:user, password: "aaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end

    it "パスワードが6文字以上なら登録できる" do
      user = build(:user, password: "aaaaaa")
      expect(user).to be_valid
    end

    it "last_nameが空なら登録できない" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "first_nameが空なら登録できない" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "last_name_kanaが空なら登録できない" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが空なら登録できない" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "誕生日が空なら登録できない" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end
end