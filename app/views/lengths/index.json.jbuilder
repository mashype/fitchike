json.array!(@lengths) do |length|
  json.extract! length, :id, :appointment_length
  json.url length_url(length, format: :json)
end
