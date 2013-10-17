json.extract! office_culture, :created_at, :updated_at, :first_aider, :fire_warden
json.event_participations do
  json.array!(office_culture.event_participations) do |event_participation|
    json.partial! 'event_participations/event_participation.json.jbuilder', event_participation: event_participation
  end
end
json.dietary do
  json.partial! 'dietaries/dietary.json.jbuilder', dietary: office_culture.dietary
end if office_culture.dietary
