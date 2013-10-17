json.array!(@passports) do |passport|
  json.extract! passport, :number, :expiry, :issuing_body
  json.url passport_url(passport, format: :json)
end
