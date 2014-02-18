class GrossBuildingArea
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :dimension_group, inverse_of: :gba

  field :measurement, type: Double
  field :standard_name, type: String
  field :standard_version, type: String
end
