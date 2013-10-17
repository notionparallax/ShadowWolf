json.array!(@memberships) do |membership|
  json.extract! membership, :organisation, :membership_number, :state, :country
  json.url membership_url(membership, format: :json)
end
