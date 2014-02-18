json.id dims.id
json.extract! dims, :created_at, :updated_at
json.height do
  json.partial! "heights/height.json.jbuilder", height: dims.height
end if dims.height
json.footprint_area do
  json.partial! "footprint_areas/footprint_area.json.jbuilder", footprint_area: dims.footprint_area
end if dims.footprint_area
json.gba do
  json.partial! "gross_building_areas/gross_building_area.json.jbuilder", gba: dims.gba
end if dims.gba
json.gfa do
  json.partial! "gross_floor_areas/gross_floor_area.json.jbuilder", gfa: dims.gfa
end if dims.gfa
json.nla do
  json.partial! "net_lettable_areas/net_lettable_area.json.jbuilder", nla: dims.nla
end if dims.nla
