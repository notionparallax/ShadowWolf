json.id esd.id
json.extract! esd, :created_at, :updated_at
json.initiatives do
  json.array!(esd.initiatives) do |initiative|
    json.partial! "initiatives/initiative.json.jbuilder", initiative: initiative
  end
end
json.certifications do
  json.array!(esd.certifications) do |certification|
    json.partial! "certifications/certification.json.jbuilder", certification: certification
  end
end
