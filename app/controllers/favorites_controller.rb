class FavoritesController < ApplicationController
  before_action :set_item, only: [:createt, :destroy]
  
  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: params[:item_id])
    # redirect_to root_path
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    favorite.destroy
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
