module ItemsHelper
  def next_item
    next_item = Item.all.order('created_at DESC').limit(1).first
  end

  def prev_item
    prev_item = Item.all.sample
    prev_item_id =prev_item
  end

end
