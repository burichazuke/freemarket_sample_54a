require 'rails_helper'
describe Item do
  describe '#create' do

    it "全てのバリデーションをクリアすれば商品出品できる" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "商品名が空なら出品できない" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "商品説明が空なら出品できない" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include('を入力してください')
    end

    it "サイズが空なら出品できない" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include('を入力してください')
    end

    it "商品の状態が空なら出品できない" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include('を入力してください')
    end

    it "配送料の負担が空なら出品できない" do
      item = build(:item, shipping_fee: nil)
      item.valid?
      expect(item.errors[:shipping_fee]).to include('を入力してください')
    end

    it "配送の方法が空なら出品できない" do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method]).to include('を入力してください')
    end

    it "発送元の地域が空なら出品できない" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include('を入力してください')
    end

    it "配送までの日数が空なら出品できない" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include('を入力してください')
    end

    it "価格が空なら出品できない" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include('を入力してください')
    end

    it "販売利益が空なら出品できない" do
      item = build(:item, profit: nil)
      item.valid?
      expect(item.errors[:profit]).to include('を入力してください')
    end

    it "カテゴリーが空なら出品できない" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category]).to include('を入力してください')
    end

    it "出品者のIDが空なら出品できない" do
      item = build(:item, seller_id: nil)
      item.valid?
      expect(item.errors[:seller]).to include('を入力してください')
    end

    it "商品のステータスが空なら出品できない" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include('を入力してください')
    end
    

    
  end
end