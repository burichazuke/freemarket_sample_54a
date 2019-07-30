class CategoriesController < ApplicationController
  def index
  end

  def show
    @category =  Category.includes(:items).find(params[:id])
    @children = Category.find(params[:id]).children.limit(8)
    @grandchildren = Category.find(params[:id]).siblings.limit(7)
    # 現在地が親なら
    if params[:id].to_i<=13
      ids = Category.find(params[:id]).descendant_ids
      @items = Item.where(category_id: ids)
    # 現在地が子なら
    elsif params[:id].to_i<158
      ids = Category.find(params[:id]).child_ids
      @items = Item.where(category_id: ids)
    # 現在地が孫なら
    else
      ids = Category.find(params[:id]).child_ids
    end
    @items = Item.where(category_id: params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name,:ancestry)
  end
  
end
