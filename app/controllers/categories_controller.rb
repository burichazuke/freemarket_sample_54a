class CategoriesController < ApplicationController
  before_action :set_category

  def index
  end

  def show
    @category =  Category.includes(:items).find(params[:id])
    @children = Category.find(params[:id]).children
    @grandchildren = Category.find(params[:id]).siblings
    @items = Category.all.includes(:items)
  end
  
  
  private

  def category_params
    params.require(:category).permit(:name,:ancestry)
  end

  def set_category
    @parents = Category.all.order('id ASC').limit(13)
  end
  
end
