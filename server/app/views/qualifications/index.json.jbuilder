json.array!(@qualifications) do |qualification|
  json.partial! "qualifications/qualification.json.jbuilder", qualification: qualification
end
