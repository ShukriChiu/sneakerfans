json.brands do 
  json.array! @brands do |brand|
    json.(brand, :id, :brand_name)
  end
end