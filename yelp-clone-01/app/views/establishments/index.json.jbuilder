json.array!(@establishments) do |establishment|
  json.extract! establishment, :id, :name, :street_address, :city, :province, :postal_code, :phone, :website, :avatar_url, :description
  json.url establishment_url(establishment, format: :json)
end
