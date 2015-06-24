class Building
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :qas, class_name: 'QualityAssurance'
  accepts_nested_attributes_for :qas

  embeds_one :press, class_name: 'BuildingPress'
  accepts_nested_attributes_for :press

  embeds_one :legacy
  accepts_nested_attributes_for :legacy

  embeds_many :phases
  accepts_nested_attributes_for :phases

  embeds_one :relationship_description
  accepts_nested_attributes_for :relationship_description

  embeds_one :client
  accepts_nested_attributes_for :client

  embeds_many :dims, class_name: 'Dimension'
  accepts_nested_attributes_for :dims

  embeds_one :project_source
  accepts_nested_attributes_for :project_source

  embeds_many :locations
  accepts_nested_attributes_for :locations

  embeds_many :brief_elements, class_name: 'BriefElement'
  accepts_nested_attributes_for :brief_elements

  embeds_many :building_relationships
  accepts_nested_attributes_for :building_relationships

  embeds_many :extras
  accepts_nested_attributes_for :extras

  embedded_in :project

  field :description, type: String
  field :attribution, type: String
  field :BCA_classification, type: Array
  field :project_categories, type: Array
  field :project_sub_catagories, type: Array
  field :source_information_filepath, type: String
  field :planning_authority, type: String
  field :legacy_bd_number, type: String
  field :confidential, type: Boolean, default: false
  field :is_bd, type: Boolean, default: false

  after_initialize if: :new_record? do |doc|
    doc.client = Client.new
    doc.project_source = ProjectSource.new
    doc.legacy = Legacy.new
    doc.relationship_description = RelationshipDescription.new
    doc.dims = [Dimension.new]
    doc.qas = [QualityAssurance.new]
    doc.locations = [Location.new]
    doc.phases = [Phase.new]
    doc.press = BuildingPress.new
    doc.brief_elements = [BriefElement.new]
    doc.building_relationships = [BuildingRelationship.new]
    doc.extras = [Extra.new]
  end
end
