class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order("created_at desc")
    # @image = Image.find_by(item_id: 1)
  end

  def show
  end

  def new
    @item = ""
    render layout: "single"
  end

  def buy
    render layout: "single"
  end
end
