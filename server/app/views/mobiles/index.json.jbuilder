json.array!(@mobiles) do |mobile|
  json.extract! mobile, :number, :is_bvn, :distribute
  json.url mobile_url(mobile, format: :json)
end
