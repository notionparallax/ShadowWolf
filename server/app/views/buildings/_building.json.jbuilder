json.id building.id
json.extract! building, :created_at, :updated_at, :description, :attribution, :BCA_classification, :project_categories, :project_sub_catagories, :source_information_filepath, :planning_authority, :legacy_bd_number, :confidential, :is_bd
json.locations do
  json.array!(building.locations) do |location|
    json.partial! "locations/location.json.jbuilder", location: location
  end
end
json.brief_elements do
  json.array!(building.brief_elements) do |brief_element|
    json.partial! "brief_elements/brief_element.json.jbuilder", brief_element: brief_element
  end
end
json.project_source do
  json.partial! "project_sources/project_source.json.jbuilder", project_source: building.project_source
end if building.project_source
json.dims do
  json.array!(building.dims) do |dimension|
    json.partial! "dimensions/dimension.json.jbuilder", dimension: dimension
  end
end
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
json.press do |press|
  json.partial! "building_presses/building_press.json.jbuilder", press: building.press
end
json.qas do
  json.array!(building.qas) do |qa|
    json.partial! "quality_assurances/quality_assurance.json.jbuilder", qa: qa
  end
end
json.building_relationships do
  json.array!(building.building_relationships) do |building_relationship|
    json.partial! "building_relationships/building_relationship.json.jbuilder", building_relationship: building_relationship
  end
end
json.extras do
  json.array!(building.extras) do |extra|
    json.partial! "extras/extra.json.jbuilder", extra: extra
  end
end
