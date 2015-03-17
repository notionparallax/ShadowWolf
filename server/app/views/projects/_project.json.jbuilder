json.id project.id
json.extract! project, :created_at, :updated_at, :project_number, :img, :value
json.non_building do
  json.partial! "non_buildings/non_building.json.jbuilder", non_building: project.non_building
end if project.non_building
json.building do
  json.partial! "buildings/building.json.jbuilder", building: project.building
end if project.building
json.related_projects do
  json.array!(project.related_projects) do |related_project|
    json.partial! "related_projects/related_project.json.jbuilder", related_project: related_project
  end
end
