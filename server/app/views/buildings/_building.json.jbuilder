json.id building.id
json.extract! building, :created_at, :updated_at, :description, :attribution, :BCA_classification, :project_catagories, :project_sub-catagories
json.location do
  json.partial! "locations/location.json.jbuilder", location: building.location
end if building.location
json.project_source do
  json.partial! "project_sources/project_source.json.jbuilder", project_source: building.project_source
end if building.project_source
json.dims do
  json.partial! "dimension_groups/dimension_group.json.jbuilder", dims: building.dims
end if building.dims
json.client do
  json.partial! "clients/client.json.jbuilder", client: building.client
end if building.client
json.relationship_description do
  json.partial! "relationship_descriptions/relationship_description.json.jbuilder", relationship_description: building.relationship_description
end if building.relationship_description
json.phase do
  json.partial! "phases/phase.json.jbuilder", phase: building.phase
end if building.phase
json.legacy do
  json.partial! "legacies/legacy.json.jbuilder", legacy: building.legacy
end if building.legacy
json.building_press do
  json.partial! "building_presses/building_press.json.jbuilder", building_press: building.building_press
end if building.building_press
json.qas do
  json.array!(building.qas) do |qa|
    json.partial! "quality_assurances/quality_assurance.json.jbuilder", qa: qa
  end
end
