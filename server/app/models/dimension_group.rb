class DimensionGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :dimensions, class_name: 'Dimension'
  accepts_nested_attributes_for :dimension

  embedded_in :building, inverse_of: :dims

  field :dirty_size, type: String
end
