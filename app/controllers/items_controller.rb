class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order("created_at desc")
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
