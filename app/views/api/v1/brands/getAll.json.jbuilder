json.success true
json.results do 
  json.array! @brands do |brand|
    json.name brand.brand_name
    json.value brand.id
    json.text brand.brand_name
  end
end