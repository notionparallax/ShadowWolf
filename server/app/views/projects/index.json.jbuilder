json.array!(@projects) do |project|
  json.id project.id
  json.extract! project, :created_at, :updated_at, :project_number, :img
end
