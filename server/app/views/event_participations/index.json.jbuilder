json.array!(@event_participations) do |event_participation|
  json.partial! "event_participations/event_participation.json.jbuilder", event_participation: event_participation
end
