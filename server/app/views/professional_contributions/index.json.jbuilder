json.array!(@professional_contributions) do |professional_contribution|
  json.extract! professional_contribution, :activity, :description, :url
  json.url professional_contribution_url(professional_contribution, format: :json)
end
