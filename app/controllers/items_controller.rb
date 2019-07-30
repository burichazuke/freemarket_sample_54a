class ItemsController < ApplicationController
  # before_action :user_signed_in?, only:[:new, :create, :edit, :update, :destroy]
  before_action :set_item, only:[:show, :edit, :update, :destroy, :buy, :pay]

  def index
    @items = Item.includes(:images).order("created_at desc").limit(8)
    ids = Category.find(1).descendant_ids
    @ladies_items = Item.where(category_id: ids).order("created_at desc").limit(4)
    ids = Category.find(2).descendant_ids
    @mens_items = Item.where(category_id: ids).order("created_at desc").limit(4)
    ids = Category.find(3).descendant_ids
    @babys_items = Item.where(category_id: ids).order("created_at desc").limit(4)
    ids = Category.find(7).descendant_ids
    @cosmetics_items = Item.where(category_id: ids).order("created_at desc").limit(4)
  end

  def show
    @comments = Comment.where(item_id: @item.id)
    @comment = Comment.new
  end

  def new
    @item = Item.new
    render layout: "single"
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      item_params[:image_files].each do |image|
        @item.images.create(image: image)
      end
      redirect_to item_path(@item)
    else
      render :new, layout: "single"
    end
  end
  
  def edit
    render layout: "single"
  end

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  def destroy
    if @item.destroy
      redirect_to action: "index"
    else
      flash[:notice] = "削除に失敗しました"
      redirect_to action: "show"
    end
  end

  def buy
    card = Card.find_by(user_id: current_user.id)
    if card
      Payjp.api_key = ENV["PAYJP_TEST_SECRET"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id) 
    end
    render layout: "single"
  end

  def pay
    @item.update(item_params)
    Payjp.api_key = ENV['PAYJP_TEST_SECRET']
    Payjp::Charge.create(
      amount: @item.price, # 決済する値段
      customer: current_user.card.customer_id,
      currency: 'jpy'
    )
    redirect_to root_path
  end

  # 出品ページでカテゴリーのセレクトボックス用。jbuilderとroutes.rbと繋がっています
  def category_children
    @select_children = Category.find(params[:parent_id]).children
  end

  def category_grandchildren
    @select_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def search
    @items = Item.where("name LIKE(?)", "%#{params[:keyword]}%").includes(:images).order("created_at desc")
    @keyword = params[:keyword]
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size, :condition, :shipping_fee, :shipping_method, :prefecture, :shipping_date, :price, :status, :profit, :seller_id, :buyer_id, {image_files: []}).merge(seller_id: current_user.id)
  end

  # 編集画面で使用？？要らない記述かもしれないです
  def update_item_params
    params.require(:item).permit(:name, :description, :size, :condition, :shipping_fee, :shipping_method, :prefecture, :shipping_date, :price, :status, :profit, :seller_id, :buyer_id, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
    @grandchild = Category.find(@item.category_id)
  end

end
  
