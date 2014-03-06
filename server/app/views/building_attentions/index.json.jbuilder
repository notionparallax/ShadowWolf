json.array!(@building_attentions) do |attention|
  json.partial! "building_attentions/building_attention.json.jbuilder", building_attention: building_attention
end
