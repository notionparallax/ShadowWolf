json.array!(@applications) do |application|
  json.extract! application, :date, :covering_letter, :portfolio, :assessment, :future_consideration, :skills_and_keywords
  json.url application_url(application, format: :json)
end
