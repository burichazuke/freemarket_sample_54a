class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order("created_at desc")
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.build
    render layout: "single"
  end

  def create
    @item = Item.create(item_params)
    redirect_to item_path(@item)
  end

  def buy
    render layout: "single"
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :size, :condition, :shipping_fee, :shipping_method, :prefecture, :shipping_date, :price, :status, :profit, images_attributes: [:image]).merge(seller_id: current_user.id)
  end
end