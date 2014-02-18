class RelationshipDescription
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :building

  field :client, type: String
  field :stakeholder, type: String
  field :councils, type: String
end
