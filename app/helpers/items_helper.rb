module ItemsHelper
  def next_item
    next_item = Item.last
  end

  def prev_item
    prev_item = Item.all.sample

  end

end
