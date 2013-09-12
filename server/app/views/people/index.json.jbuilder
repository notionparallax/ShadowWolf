json.array!(@people) do |person|
  json.extract! person, :created_at, :updated_at
  json.partial! 'people/person', person: person
end
