class CategoriesController < ApplicationController
  

  def index
  end

  def show
    @category =  Category.includes(:items).find(params[:id])
    @children = Category.find(params[:id]).children
    @grandchildren = Category.find(params[:id]).siblings
    
    
    if params[:id].to_i<=13
      ids = Category.find(params[:id]).descendant_ids
      @items = Item.where(category_id: ids)
    elsif params[:id].to_i<158
      ids = Category.find(params[:id]).child_ids
      @items = Item.where(category_id: ids)
    else
      @items = Item.where(category_id: params[:id])
    end
  end

  private

  def category_params
    params.require(:category).permit(:name,:ancestry)
  end
  
end
