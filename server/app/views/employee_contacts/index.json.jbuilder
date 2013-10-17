json.array!(@employee_contacts) do |employee_contact|
  json.extract! employee_contact, :extension, :studio, :work_email
  json.url employee_contact_url(employee_contact, format: :json)
end
