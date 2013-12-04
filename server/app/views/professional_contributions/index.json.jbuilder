json.array!(@professional_contributions) do |professional_contribution|
  json.partial! "professional_contributions/professional_contribution.json.jbuilder", professional_contribution: professional_contribution
end
