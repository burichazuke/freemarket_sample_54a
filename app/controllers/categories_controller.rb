class CategoriesController < ApplicationController

  def index
    @parents = Category.all.order('id ASC').limit(13)
  end

  def show
    @parents = Category.find(params[:id])
    @items = Item.includes(:images).order("created_at desc")
  end
  
  private
  def category_params
    params.require(:category).permit(:name,:ancestry)
  end
end
