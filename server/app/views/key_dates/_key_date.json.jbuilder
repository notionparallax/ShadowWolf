json.id key_date.id
json.extract! key_date, :created_at, :updated_at, :start_date, :end_date
json.other_dates do
  json.array!(key_date.other_dates) do |other_date|
    json.partial! "other_dates/other_date.json.jbuilder", other_date: other_date
  end
end
