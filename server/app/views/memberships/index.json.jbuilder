json.array!(@memberships) do |membership|
  json.partial! "memberships/membership.json.jbuilder", membership: membership
end
