crumb :brands do
  link "ブランド一覧"
end

crumb :brand_name do |brand_name|
  brand_name = Brand.find_by(id: params[:id])
  link brand_name.name
  parent :root
end