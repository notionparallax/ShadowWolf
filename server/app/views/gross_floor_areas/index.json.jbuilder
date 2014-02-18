json.array!(@gross_floor_areas) do |gfa|
  json.partial! "gross_floor_areas/gross_floor_area.json.jbuilder", gross_floor_area: gross_floor_area
end
