json.array!(@people) do |person|
  json.partial! 'person', person: person
  json.extract! person, :created_at, :updated_at
end
