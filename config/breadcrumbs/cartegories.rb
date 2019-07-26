crumb :categories do
  link "カテゴリー一覧"
end

crumb :category_parent do |category_parent|
  category_parent = Category.find_by(id: params[:id])
  link category_parent.name
  parent :categories
end

crumb :category_child do |category_child|
  category_child = Category.find_by(id: params[:id])
  link category_child.name
  parent :category_parent
end

crumb :category_grandchild do |category_grandchild|
  category_grandchild = Category.find_by(id: params[:id])
  link category_grandchild.name
  parent :category_child
end


