json.extract! employee, :created_at, :updated_at
json.photo do
  json.partial! 'photos/photo.json.jbuilder', photo: employee.photo
end if employee.photo
json.conditions do
  json.array!(employee.conditions) do |condition|
    json.partial! 'conditions/condition.json.jbuilder', condition: condition
  end
end
json.contact do
  json.partial! 'contacts/contact.json.jbuilder', contact: employee.contact
end if employee.contact
