json.id press.id
json.extract! press, :created_at, :updated_at
json.attentions do
  json.array!(press.attentions) do |attention|
    json.partial! "building_attentions/building_attention.json.jbuilder", attention: attention
  end
end
json.campaigns do
  json.array!(press.campaigns) do |campaign|
    json.partial! "campaigns/campaign.json.jbuilder", campaign: campaign
  end
end
json.press_releases do
  json.array!(press.press_releases) do |press_release|
    json.partial! "press_releases/press_release.json.jbuilder", press_release: press_release
  end
end