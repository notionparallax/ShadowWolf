json.array!(@projects) do |project|
  json.partial! "projects/project.json.jbuilder", project: project
end
