class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order("created_at desc")
  end

  def show
    @item = Item.find(params[:id])

  end

  def new
    @item = ""
    render layout: "single"
  end

  def buy
    render layout: "single"
  end
end


private
  def item_params
    params.require(:item).permit(:name,:description,:category_id,:size,:brand_id,:condition,:shipping_fee,:shipping_method,:prefecture,:shipping_date,:price,:profit,:status,:seller_id,:buyer_id)
  end
