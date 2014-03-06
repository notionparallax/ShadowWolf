class EnvironmentalSustainableDesign
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :certifications

  accepts_nested_attributes_for :certifications

  embeds_many :initiatives

  accepts_nested_attributes_for :initiatives

  embedded_in :legacy, inverse_of: :esd

end
