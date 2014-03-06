json.array!(@campaigns) do |campaign|
  json.partial! "campaigns/campaign.json.jbuilder", campaign: campaign
end
