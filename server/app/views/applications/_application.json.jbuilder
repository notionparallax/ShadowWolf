json.extract! application, :created_at, :updated_at, :date, :covering_letter, :portfolio, :assessment, :future_consideration, :skills_and_keywords
json.applications do
  json.array!(application.applications) do |application|
    json.partial! 'applications/application.json.jbuilder', application: application
  end
end
