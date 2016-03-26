json.array!(@locations) do |location|
  json.extract! location, :id, :address_1, :address_2, :city, :state, :zip, :lat, :lon
  json.url location_url(location, format: :json)
end
