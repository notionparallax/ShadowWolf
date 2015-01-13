json.id client.id
json.extract! client, :created_at, :updated_at, :main, :second_contracting_party, :direct, :end_user

json.referees do
  json.array!(client.referees) do |referee|
    json.partial! "referees/referee.json.jbuilder", referee: referee
  end
end
