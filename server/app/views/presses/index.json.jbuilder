json.array!(@presses) do |press|
  json.extract! press, 
  json.url press_url(press, format: :json)
end
