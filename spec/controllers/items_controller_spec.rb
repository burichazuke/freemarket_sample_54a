require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    it "populates an array of items ordered by created_at DESC" do
      items = create_list(:item, 3) 
      get :index
      expect(assigns(:items)).to match(items.sort{|a, b| b.created_at <=> a.created_at })
    end


    it "renders the :new template" do
      get :index
      expect(response).to render_template :index
    end
  end



  describe 'GET #show' do
    it "インスタンス変数を正しく取得できているassings" do
      item = create(:item)
      get :show, params: {id: item}
      expect(assigns(:item)).to eq item
    end
    it "HTTPメソッドを正しく呼出せているかrender_template" do
      item = create(:item)
      get :show, params: {id: item}
      expect(response).to render_template :show
    end
  end


end