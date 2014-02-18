json.array!(@locations) do |location|
  json.partial! "locations/location.json.jbuilder", location: location
end
