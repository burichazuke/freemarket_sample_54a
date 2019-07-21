class CategoriesController < ApplicationController
  def index
    @parents = Category.all.order('id ASC').limit(13)
  end

  def show
    @parents = Category.find(params[:id])
  end
  
  private
  def Category_params
    params.require(:category).permit(:name,:ancestry)
  end
end
