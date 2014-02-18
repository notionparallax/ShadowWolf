json.array!(@footprint_areas) do |footprint_area|
  json.partial! "footprint_areas/footprint_area.json.jbuilder", footprint_area: footprint_area
end
