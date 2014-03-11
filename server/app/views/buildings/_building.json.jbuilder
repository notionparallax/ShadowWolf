json.id building.id
json.extract! building, :created_at, :updated_at, :description, :attribution, :BCA_classification, :project_catagories, :project_sub_catagories
json.locations do
  json.array!(building.locations) do |location|
    json.partial! "locations/location.json.jbuilder", location: location
  end
end
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
json.phases do
  json.array!(building.phases) do |phase|
    json.partial! "phases/phase.json.jbuilder", phase: phase
  end
end
json.legacy do
  json.partial! "legacies/legacy.json.jbuilder", legacy: building.legacy
end if building.legacy
json.presses do
  json.array!(building.presses) do |press|
    json.partial! "building_presses/building_press.json.jbuilder", press: press
  end
end
json.qas do
  json.array!(building.qas) do |qa|
    json.partial! "quality_assurances/quality_assurance.json.jbuilder", qa: qa
  end
end
