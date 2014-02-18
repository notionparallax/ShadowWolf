class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :building

  accepts_nested_attributes_for :building

  embeds_one :non_building

  accepts_nested_attributes_for :non_building
  field :project_number, type: String
end
