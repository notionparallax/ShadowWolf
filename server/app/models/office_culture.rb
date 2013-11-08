class OfficeCulture
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :dietary

  accepts_nested_attributes_for :dietary

  embeds_many :event_participation

  accepts_nested_attributes_for :event_participation

  embedded_in :employee

  field :first_aider, type: Boolean
  field :fire_warden, type: Boolean
end
