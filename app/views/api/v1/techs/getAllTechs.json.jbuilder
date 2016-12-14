json.techs do
  json.array! @techs do |tech|
    json.(tech, :id, :tech_name)
  end
end