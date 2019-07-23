json.array! @select_children do |child|
  json.id    child.id
  json.name  child.name
end
