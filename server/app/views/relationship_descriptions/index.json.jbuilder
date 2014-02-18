json.array!(@relationship_descriptions) do |relationship_description|
  json.partial! "relationship_descriptions/relationship_description.json.jbuilder", relationship_description: relationship_description
end
