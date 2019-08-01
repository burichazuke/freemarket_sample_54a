class UsersController < ApplicationController
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @user_items = Item.where(seller_id: @user.id).order('created_at DESC').limit(6)
  end

  def edit
  end

  def update
  end

end
