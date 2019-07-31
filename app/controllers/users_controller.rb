class UsersController < ApplicationController
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @item = Item.where(params[:id])
    @items = Item.where(params[:id])
    @user_items = Item.where(seller_id: @item.seller_id).order('created_at DESC').limit(6)
  end

  def edit
  end

  def update
  end

end
