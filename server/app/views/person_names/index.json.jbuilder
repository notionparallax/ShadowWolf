json.array!(@person_names) do |person_name|
  json.partial! "person_names/person_name.json.jbuilder", person_name: person_name
end
