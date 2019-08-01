module ItemsHelper

  def ramdom_item
    ramdom_item = Item.all.sample
  end

end
