json.id campaign.id
json.extract! campaign, :created_at, :updated_at, :strategy
json.building_press_releases do
  json.array!(campaign.building_press_releases) do |building_press_release|
    json.partial! "building_press_releases/building_press_release.json.jbuilder", building_press_release: building_press_release
  end
end
