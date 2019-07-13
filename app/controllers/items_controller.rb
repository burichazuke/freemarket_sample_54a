class ItemsController < ApplicationController

  before_action :user_signed_in?, only:[:new, :create, :edit, :update, :destroy]

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

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to action: "index"
    else
    end
  end

  
end
