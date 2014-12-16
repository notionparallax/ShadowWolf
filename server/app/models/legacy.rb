class Legacy
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :quotes
  accepts_nested_attributes_for :quotes

  embeds_many :testimonials
  accepts_nested_attributes_for :testimonials

  embeds_many :awards
  accepts_nested_attributes_for :awards

  embeds_one :photography
  accepts_nested_attributes_for :photography

  embeds_one :esd, class_name: 'EnvironmentalSustainableDesign'
  accepts_nested_attributes_for :esd

  embeds_many :initiatives
  accepts_nested_attributes_for :initiatives

  embedded_in :building

  embeds_many :templates
  accepts_nested_attributes_for :templates

  field :dirty_pictures, type: String
  field :dirty_testimonial, type: String
  field :dirty_awards, type: String

  #field :one_line_grab, type: String
  #field :description_project_sheet, type: String
  #field :description_200_500_words, type: String
  #field :description_awards_style, type: String
  #field :innovation_client_style, type: String
  #field :innovation_value_add, type: String
  #field :interesting_things, type: String
  #field :brief_elements, type: String
  #field :security_level, type: String
end
