json.extract! @person, :created_at, :updated_at
json.extract! @person.name, :first_name, :last_name, :middle_name, :preferred_first_name, :preferred_last_name
json.id @person.id
json.url person_url(@person, format: :json)
