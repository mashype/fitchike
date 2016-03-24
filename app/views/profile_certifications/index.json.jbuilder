json.array!(@profile_certifications) do |profile_certification|
  json.extract! profile_certification, :id
  json.url profile_certification_url(profile_certification, format: :json)
end
