json.array!(@dimension_groups) do |dims|
  json.partial! "dimension_groups/dimension_group.json.jbuilder", dimension_group: dimension_group
end
