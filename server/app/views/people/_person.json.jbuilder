json.name do
  json.partial! 'person_names/person_name.json.jbuilder', name: person.name
end if person.name
json.employee do
  json.partial! 'employees/employee.json.jbuilder', employee: person.employee
end if person.employee
