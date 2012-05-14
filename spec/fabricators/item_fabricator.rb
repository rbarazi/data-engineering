Fabricator(:item) do
  description { "ABC" }
  price { 5.0 }
  merchant(:fabricator => :merchnat)
end