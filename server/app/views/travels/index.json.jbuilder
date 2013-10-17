json.array!(@travels) do |travel|
  json.extract! travel, 
  json.url travel_url(travel, format: :json)
end
