class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include ParamReader

  embeds_one :building

  accepts_nested_attributes_for :building

  embeds_one :non_building

  accepts_nested_attributes_for :non_building

  embeds_many :related_projects
  accepts_nested_attributes_for :related_projects

  field :project_number, type: String
  field :img, type: String
  field :value, type: String

  after_initialize if: :new_record? do |doc|
    doc.non_building = NonBuilding.new
    doc.building = Building.new
    doc.related_projects = [RelatedProject.new]
  end
end
