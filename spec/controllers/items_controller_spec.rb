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
    it "インスタンス変数を正しく取得できている" do
      item = create(:item)
      get :show, params: {id: item}
      expect(assigns(:item)).to eq item
    end
    it "showページのビューが正しく表示できている" do
      item = create(:item)
      get :show, params: {id: item}
      expect(response).to render_template :show
    end
  end
## 各exampleで期待する値は1つ
## assignsメソッドで、コントローラ内のインスタンス変数に代入されたオブジェクトを取得する、取得する場合には、インスタンス変数名から@を除いたものをキーとして渡す、呼び出しは、assigns(:item)という形式でも取り出せる。


end