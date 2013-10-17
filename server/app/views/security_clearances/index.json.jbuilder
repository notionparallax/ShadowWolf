json.array!(@security_clearances) do |security_clearance|
  json.extract! security_clearance, :issuing_body, :level, :expiry
  json.url security_clearance_url(security_clearance, format: :json)
end
