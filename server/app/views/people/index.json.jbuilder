json.array!(@people.find_all { |p| p.current_condition and p.current_condition.name.eql? 'Active' }) do |person|
  json.id person.id
  json.name do
    json.partial! "person_names/person_name.json.jbuilder", name: person.name
  end if person.name
  json.employee do
    json.contact do
      json.partial! "employee_contacts/employee_contact.json.jbuilder", contact: person.employee.contact
    end if person.employee.contact
    json.photo do
      json.partial! "photos/photo.json.jbuilder", photo: person.employee.photo
    end if person.employee.photo
  end if person.employee
end
