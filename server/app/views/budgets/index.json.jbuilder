json.array!(@budgets) do |budget|
  json.partial! "budgets/budget.json.jbuilder", budget: budget
end
