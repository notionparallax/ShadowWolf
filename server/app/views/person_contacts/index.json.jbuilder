json.array!(@person_contacts) do |person_contact|
  json.extract! person_contact, :personal_email, :personal_phone
  json.url person_contact_url(person_contact, format: :json)
end
