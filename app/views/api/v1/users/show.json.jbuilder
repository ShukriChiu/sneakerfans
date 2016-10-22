json.user do
  json.(@user, :id, :email, :name, :admin, :created_at, :updated_at)
end