json.array! @select_grandchildren do |grandchild|
  json.id      grandchild.id
  json.name    grandchild.name
end
