class ItemsController < ApplicationController
  def index
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
