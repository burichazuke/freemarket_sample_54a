require 'rails_helper'
describe Item do
  describe '#create' do

    it "商品名が空でも出品できるか" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "商品説明が空でも出品できるか" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include('を入力してください')
    end

    it "全てのバリデーションをクリアすれば商品出品できる" do
      item = build(:item)
      expect(item).to be_valid
    end

  end
end