json.array!(@person_names) do |person_name|
  json.extract! person_name, :first_name, :last_name, :middle_name, :preferred_first_name, :preferred_last_name
  json.url person_name_url(person_name, format: :json)
end
