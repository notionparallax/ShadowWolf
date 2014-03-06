class GrossFloorArea
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :dimension_group, inverse_of: :gfa

  field :measurement, type: Float
  field :standard_name, type: String
  field :standard_version, type: String
end
