class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order("created_at desc")
  end

  def show
  end

  def new
    @item = ""
    render layout: "single"
  end

  def buy
    @item = Item.find(params[:id])
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

  private

  def item_params
    params.require(:item).permit(:name, :description, :size, :condition, :shipping_fee, :shipping_method, :prefecture, :shipping_date, :price, :status, :buyer_id, images_attributes: [:image]).merge(seller_id: current_user.id, profit: 400)
  end

end
