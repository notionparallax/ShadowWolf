json.array!(@person_names) do |person_name|
  json.extract! person_name, :prefix, :first, :middle, :last, :suffix, :preferred_first, :preferred_last
  json.url person_name_url(person_name, format: :json)
end
