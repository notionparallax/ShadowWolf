json.array!(@preferences) do |preference|
  json.extract! preference, :likes, :dislikes
  json.url preference_url(preference, format: :json)
end
