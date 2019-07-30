class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(favorite_params)
    @favorite.destroy
  end

  private
    def favorite_params
      params.permit(:item_id).merge(user_id: current_user.id)
    end
end