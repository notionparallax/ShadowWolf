json.array!(@other_dates) do |other_date|
  json.partial! "other_dates/other_date.json.jbuilder", other_date: other_date
end
