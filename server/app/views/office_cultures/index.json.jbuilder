json.array!(@office_cultures) do |office_culture|
  json.extract! office_culture, :first_aider, :fire_warden
  json.url office_culture_url(office_culture, format: :json)
end
