json.array!(@gross_building_areas) do |gba|
  json.partial! "gross_building_areas/gross_building_area.json.jbuilder", gross_building_area: gross_building_area
end
