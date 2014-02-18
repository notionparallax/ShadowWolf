class NonBuilding
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :project

  field :name, type: String
  field :description, type: String
end
