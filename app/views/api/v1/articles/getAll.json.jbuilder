json.articles do 
  json.array! @articles do |article|
    json.(article, :id, :title, :techs, :picture, :address)
  end
end