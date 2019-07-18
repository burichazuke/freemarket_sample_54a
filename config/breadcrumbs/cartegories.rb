crumb :categories do
  link "カテゴリー一覧"
end

crumb :category_name do |category_name|
  category_name = Category.find_by(id: params[:id])
  link category_name.name
  parent :categories
end
