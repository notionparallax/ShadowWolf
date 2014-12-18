class Building
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :qas, class_name: 'QualityAssurance'
  accepts_nested_attributes_for :qas

  embeds_many :presses, class_name: 'BuildingPress'
  accepts_nested_attributes_for :presses

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

  embedded_in :project

  field :description, type: String
  field :attribution, type: String
  field :BCA_classification, type: String
  field :project_categories, type: Array
  field :project_sub_catagories, type: Array
  field :source_information_filepath, type: String
end
