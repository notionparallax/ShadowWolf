json.array!(@person_names) do |name|
  json.partial! "person_names/person_name.json.jbuilder", person_name: person_name
end
