class UsersController < ApplicationController
  
  def index
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
    @user = User.find(current_user.id)
    @items = Item.where(seller_id: current_user.id)
  end

  def edit
  end

  def update
  end

end
