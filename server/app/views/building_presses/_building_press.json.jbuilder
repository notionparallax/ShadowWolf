json.id building_press.id
json.extract! building_press, :created_at, :updated_at
json.building_attentions do
  json.array!(building_press.building_attentions) do |building_attention|
    json.partial! "building_attentions/building_attention.json.jbuilder", building_attention: building_attention
  end
end
json.campaigns do
  json.array!(building_press.campaigns) do |campaign|
    json.partial! "campaigns/campaign.json.jbuilder", campaign: campaign
  end
end
