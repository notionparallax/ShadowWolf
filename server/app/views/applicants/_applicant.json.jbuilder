json.id applicant.id
json.extract! applicant, :created_at, :updated_at
json.applications do
  json.array!(applicant.applications) do |application|
    json.partial! "applications/application.json.jbuilder", application: application
  end
end
