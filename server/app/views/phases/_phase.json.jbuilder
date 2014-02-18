json.id phase.id
json.extract! phase, :created_at, :updated_at, :project_name, :studio, :client, :services_scope, :delivery_contract, :staff_contact_login, :staff_custodian_login
json.key_date do
  json.partial! "key_dates/key_date.json.jbuilder", key_date: phase.key_date
end if phase.key_date
json.budget do
  json.partial! "budgets/budget.json.jbuilder", budget: phase.budget
end if phase.budget
