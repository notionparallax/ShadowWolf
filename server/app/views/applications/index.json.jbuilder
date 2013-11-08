json.array!(@applications) do |application|
  json.partial! "applications/application.json.jbuilder", application: application
end
