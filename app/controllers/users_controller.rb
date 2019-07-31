class UsersController < ApplicationController
  
  def index
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])

  end

  def edit
  end

  def update
  end

end
