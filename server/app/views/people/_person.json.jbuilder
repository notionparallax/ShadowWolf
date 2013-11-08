json.id person.id
json.name do
  json.partial! 'person_names/person_name.json.jbuilder', name: person.name
end if person.name
json.employee do
  json.partial! 'employees/employee.json.jbuilder', employee: person.employee
end if person.employee
json.contact do
  json.partial! 'person_contacts/person_contact.json.jbuilder', contact: person.contact
end if person.contact
json.applicant do
  json.partial! 'applicants/applicant.json.jbuilder', applicant: person.applicant
end if person.applicant
json.person_name do
  json.partial! "app/views/person_names/person_name.json.jbuilder", person_name: person.person_name
end if person.person_name
json.employee do
  json.partial! "app/views/employees/employee.json.jbuilder", employee: person.employee
end if person.employee
json.person_contact do
  json.partial! "app/views/person_contacts/person_contact.json.jbuilder", person_contact: person.person_contact
end if person.person_contact
json.name do
  json.partial! "app/views/person_names/person_name.json.jbuilder", name: person.name
end if person.name
json.contact do
  json.partial! "app/views/person_contacts/person_contact.json.jbuilder", contact: person.contact
end if person.contact
