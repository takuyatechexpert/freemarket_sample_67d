json.array! @category_grandchildren do |grandchild|
  json.id grandchild.id
  json.name grandchild.category_name
end