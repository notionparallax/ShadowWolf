json.array!(@projects) do |project|
  json.id project.id
  json.extract! project, :created_at, :updated_at, :project_number, :img
  if project.building and project.building.phases.first
    json.project_name project.building.phases.first.project_name 
  end
end
