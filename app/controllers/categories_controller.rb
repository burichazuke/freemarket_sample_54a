class CategoriesController < ApplicationController
  before_action :set_category

  def index
    @parents = Category.all.order('id ASC').limit(13)
  end

  def show
    @parents = Category.all.order('id ASC').limit(13)
  end
  
  private
  def category_params
    params.require(:category).permit(:name,:ancestry)
  end

  def set_category
    @parents = Category.all.order('id ASC').limit(13)
  end
  
end
