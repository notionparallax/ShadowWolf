class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include ParamReader

  embeds_one :building

  accepts_nested_attributes_for :building

  embeds_one :non_building

  accepts_nested_attributes_for :non_building
  field :project_number, type: String
  field :img, type: String
end
