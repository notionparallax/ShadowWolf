json.id location.id
json.extract! location, :created_at, :updated_at
json.geo_json do
  json.partial! "geo_jsons/geo_json.json.jbuilder", geo_json: location.geo_json
end if location.geo_json
json.address do
  json.partial! "addresses/address.json.jbuilder", address: location.address
end if location.address
