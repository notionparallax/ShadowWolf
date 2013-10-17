class Dietary
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :preference

  accepts_nested_attributes_for :preference

  embeds_one :preferences

  accepts_nested_attributes_for :preferences

  embedded_in :office_culture

  field :requirements, type: String
end
