require 'rails_helper'

describe ItemsController do

  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:item) { build(:item) }
  let(:params) { { item: { name: item.name, description: item.description, size: item.size, condition: item.condition, shipping_fee: item.shipping_fee, shipping_method: item.shipping_method, prefecture: item.prefecture, shipping_date: item.shipping_date, price: item.price, profit: item.profit, status: item.status, created_at: item.created_at, category_id: category.id, seller_id: user.id,image_files: ["3333", "333"]  }} }

  describe 'GET #index' do
    it "インスタンス変数を正しく取得できているか/assings" do
      items = create_list(:item, 3) 
      get :index
      expect(assigns(:items)).to match(items.sort{|a, b| b.created_at <=> a.created_at })
    end


    it "HTTPメソッドを正しく呼出せているか/render_template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "インスタンス変数を正しく取得できているか/assings" do
      item = create(:item)
      get :show, params: {id: item}
      expect(assigns(:item)).to eq item
    end
    it "HTTPメソッドを正しく呼出せているか/render_template" do
      item = create(:item)
      get :show, params: {id: item}
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "HTTPメソッドを正しく呼出せているか/render_template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'CREATE #create' do

    before do
      login user
    end

    it "出品機能が機能しているか" do
      expect{
        post :create, params: params
      }.to change(Item, :count).by(1)
    end
  end



  describe 'DELETE #destroy' do
    it "削除機能が機能しているか" do
      item = create(:item)
      expect{
        delete :destroy,  params: {id: item}
      }. to change(Item, :count).by(-1)
    end
  end
end