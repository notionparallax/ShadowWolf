json.array!(@registrations) do |registration|
  json.partial! "registrations/registration.json.jbuilder", registration: registration
end
