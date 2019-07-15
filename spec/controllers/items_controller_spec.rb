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



  describe 'DELETE #destroy' do
    it "削除機能が機能しているか" do
      item = create(:item)
      expect{
        delete :destroy, id: item
      }. to change(Item, :count).by(-1)
    end
  end


end