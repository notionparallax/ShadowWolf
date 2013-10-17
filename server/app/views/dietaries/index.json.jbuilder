json.array!(@dietaries) do |dietary|
  json.extract! dietary, :requirements
  json.url dietary_url(dietary, format: :json)
end
