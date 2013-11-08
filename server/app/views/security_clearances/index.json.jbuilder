json.array!(@security_clearances) do |security_clearance|
  json.partial! "security_clearances/security_clearance.json.jbuilder", security_clearance: security_clearance
end
