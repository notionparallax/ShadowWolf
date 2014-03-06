class Height
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :dimension_group

  field :measurement, type: Float
  field :standard_name, type: String
  field :standard_version, type: String
end
