class DimensionGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :nla, class_name: 'NetLettableArea'

  accepts_nested_attributes_for :nla

  embeds_one :gfa, class_name: 'GrossFloorArea'

  accepts_nested_attributes_for :gfa

  embeds_one :gba, class_name: 'GrossBuildingArea'

  accepts_nested_attributes_for :gba

  embeds_one :footprint_area

  accepts_nested_attributes_for :footprint_area

  embeds_one :height

  accepts_nested_attributes_for :height

  embedded_in :building, inverse_of: :dims

end
