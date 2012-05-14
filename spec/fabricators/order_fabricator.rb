Fabricator(:order) do
  quantity { 12 }
  item(:fabricator => :item)
  purchaser(:fabricator => :purchaser)
end