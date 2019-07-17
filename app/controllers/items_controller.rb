class ItemsController < ApplicationController

  before_action :user_signed_in?, only:[:new, :create, :edit, :update, :destroy]
  before_action :set_item, only:[:show, :destroy]

  def index
    @items = Item.includes(:images).order("created_at desc")
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def new
    @item = Item.new
    @item.images.build
    render layout: "single"
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      render :new, layout: "single"
    end
  end

  def buy
    @item = Item.find(params[:id])
    card = Card.find_by(user_id: current_user.id)
    if card
      Payjp.api_key = ENV["PAYJP_TEST_SECRET"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id) 
    end
    render layout: "single"
  end

  def edit
  end

  def update
  end

  def pay
    @item = Item.find(params[:id])
    @item.update(item_params)
    Payjp.api_key = ENV['PAYJP_TEST_SECRET']
    Payjp::Charge.create(
      amount: @item.price, # 決済する値段
      customer: current_user.card.customer_id,
      currency: 'jpy'
    )
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

  private

  def item_params
    params.require(:item).permit(:name, :description, :size, :condition, :shipping_fee, :shipping_method, :prefecture, :shipping_date, :price, :status, :profit, :buyer_id, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  

end
