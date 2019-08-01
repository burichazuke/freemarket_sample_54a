class UsersController < ApplicationController
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(seller_id: current_user.id)
  end

  def edit
  end

  def update
  end

end
