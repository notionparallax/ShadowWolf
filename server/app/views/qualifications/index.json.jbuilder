json.array!(@qualifications) do |qualification|
  json.extract! qualification, :name, :level, :institution, :first_year, :last_year
  json.url qualification_url(qualification, format: :json)
end
