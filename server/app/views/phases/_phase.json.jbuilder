json.id phase.id
json.extract! phase, :created_at, :updated_at, :dirty_members, :project_name, :studio, :client, :services_scope, :delivery_contract, :staff_contact_login, :staff_custodian_login, :dirty_date, :referee, :dirty_finish
json.key_dates do
  json.array!(phase.key_dates) do |key_date|
    json.partial! "key_dates/key_date.json.jbuilder", key_date: key_date
  end
end
json.budget do
  json.partial! "budgets/budget.json.jbuilder", budget: phase.budget
end if phase.budget
