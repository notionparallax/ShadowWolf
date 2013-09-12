json.extract! @person, :created_at, :updated_at
json.name do
  json.extract! @person.name, :first, :last, :middle, :preferred_first, :preferred_last
end
json.id @person.id
json.url person_url(@person, format: :json)
