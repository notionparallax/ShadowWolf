json.array!(@building_presses) do |press|
  json.partial! "building_presses/building_press.json.jbuilder", building_press: building_press
end
