json.user do
  json.(@user, :id, :email, :password_digest, :name, :admin, :created_at, :updated_at)
end