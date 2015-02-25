class BuildingRelationship
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :building

  field :entity, type: String
  field :relationship_name, type: String
  field :relationship_description, type: String
  field :start_date, type: String
  field :end_date, type: String
end
