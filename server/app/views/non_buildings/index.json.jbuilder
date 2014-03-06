json.array!(@non_buildings) do |non_building|
  json.partial! "non_buildings/non_building.json.jbuilder", non_building: non_building
end
