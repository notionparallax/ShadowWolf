json.array!(@people) do |person|
  json.cache! person do
    json.partial! "people/person.json.jbuilder", person: person
  end
end
