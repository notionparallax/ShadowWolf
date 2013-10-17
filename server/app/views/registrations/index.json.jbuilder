json.array!(@registrations) do |registration|
  json.extract! registration, :organisation, :registration_number, :state, :country
  json.url registration_url(registration, format: :json)
end
