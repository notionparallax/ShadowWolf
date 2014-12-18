class Dimension
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :building, inverse_of: :dims
  
  field :title, type: String
  field :measurement, type: Float
  field :standard_name, type: String
  field :standard_version, type: String
  field :unit, type: String
  field :tags, type: Array, default: []
end
