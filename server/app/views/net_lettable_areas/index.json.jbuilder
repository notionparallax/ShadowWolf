json.array!(@net_lettable_areas) do |nla|
  json.partial! "net_lettable_areas/net_lettable_area.json.jbuilder", net_lettable_area: net_lettable_area
end
