json.array!(@geo_jsons) do |geo_json|
  json.partial! "geo_jsons/geo_json.json.jbuilder", geo_json: geo_json
end
