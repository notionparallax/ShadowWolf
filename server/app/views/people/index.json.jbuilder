json.array!(@people) do |person|
  json.partial! "people/person.json.jbuilder", person: person
end
