crumb :items do
  link "一覧", items_path
end

crumb :item_name do |item_name|
  item_name = Item.find_by(id: params[:id])
  link item_name.name
  parent :root
end

crumb :item_search do |item_search|

  if params[:keyword]
    link "#{params[:keyword]}"
  elsif params[:q][:name_cont_all].blank?
    link "商品一覧" 
  else 
    qs = params[:q][:name_cont_all]
    qs.each do |q|
      link "#{q}"
    end
  end
  parent :root
end