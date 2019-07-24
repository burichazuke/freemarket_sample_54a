class FavoritesController < ApplicationController
   def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: params[:item_id])
    @favorites = Favorite.where(item_id: params[:item_id])
    @items = Item.all
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    favorite.destroy
    @favorites = Favorite.where(item_id: params[:item_id])
    @items = Item.all
  end
end