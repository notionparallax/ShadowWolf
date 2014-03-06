json.array!(@project_sources) do |project_source|
  json.partial! "project_sources/project_source.json.jbuilder", project_source: project_source
end
