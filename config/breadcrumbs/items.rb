crumb :items do
  link "一覧", items_path
end

crumb :item_name do |item_name|
  item_name = Item.find_by(id: params[:id])
  link item_name.name
  parent :root
end

crumb :item_search do |item_search|
  link "#{params[:keyword]}"
  parent :root
end