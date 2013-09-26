json.array!(@photos) do |photo|
  json.extract! photo, :fun, :bw, :colour
  json.url photo_url(photo, format: :json)
end
