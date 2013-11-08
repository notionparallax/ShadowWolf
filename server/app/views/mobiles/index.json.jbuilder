json.array!(@mobiles) do |mobile|
  json.extract! mobile, 
  json.url mobile_url(mobile, format: :json)
end
