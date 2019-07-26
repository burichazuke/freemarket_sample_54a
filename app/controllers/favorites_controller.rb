class FavoritesController < ApplicationController

  
  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: params[:item_id])

  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    @favorite.destroy
  end



end