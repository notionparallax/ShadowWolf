json.array!(@conditions) do |condition|
  json.extract! condition, :name, :start_date, :end_date
  json.url condition_url(condition, format: :json)
end
