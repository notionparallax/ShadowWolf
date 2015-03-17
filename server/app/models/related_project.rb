class RelatedProject
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :project

  field :project_number, type: String
  field :description, type: String
end
