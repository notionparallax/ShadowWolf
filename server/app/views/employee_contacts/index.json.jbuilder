json.array!(@employee_contacts) do |employee_contact|
  json.partial! "employee_contacts/employee_contact.json.jbuilder", employee_contact: employee_contact
end
