json.array!(@conditions) do |condition|
  json.partial! "conditions/condition.json.jbuilder", condition: condition
end
