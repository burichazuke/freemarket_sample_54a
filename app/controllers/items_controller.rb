class ItemsController < ApplicationController

  before_action :user_signed_in?, only:[:new, :create, :edit, :update, :destroy]

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
    render layout: "single"
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to action: "index"
    else
    end
  end

  
end

  private

  def item_params
    params.require(:item).permit(:name, :description, :size, :condition, :shipping_fee, :shipping_method, :prefecture, :shipping_date, :price, :status, :profit, images_attributes: [:image]).merge(seller_id: current_user.id)
  end
end
