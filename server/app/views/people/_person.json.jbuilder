json.id person.id
json.extract! person, :created_at, :updated_at
json.name do
  json.partial! "person_names/person_name.json.jbuilder", name: person.name
end if person.name
json.employee do
  json.partial! "employees/employee.json.jbuilder", employee: person.employee
end if person.employee
json.conditions do
  json.array!(person.conditions) do |condition|
    json.partial! "conditions/condition.json.jbuilder", condition: condition
  end
end
json.contact do
  json.partial! "person_contacts/person_contact.json.jbuilder", contact: person.contact
end if person.contact
json.applicant do
  json.partial! "applicants/applicant.json.jbuilder", applicant: person.applicant
end if person.applicant
