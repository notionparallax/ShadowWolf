json.array!(@building_press_releases) do |building_press_release|
  json.partial! "building_press_releases/building_press_release.json.jbuilder", building_press_release: building_press_release
end
