json.array!(@buildings) do |building|
  json.partial! "buildings/building.json.jbuilder", building: building
end
