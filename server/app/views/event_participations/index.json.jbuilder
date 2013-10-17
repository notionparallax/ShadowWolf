json.array!(@event_participations) do |event_participation|
  json.extract! event_participation, :name, :date, :url
  json.url event_participation_url(event_participation, format: :json)
end
