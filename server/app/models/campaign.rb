class Campaign
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :building_press_releases

  accepts_nested_attributes_for :building_press_releases

  embedded_in :building_press

  field :strategy, type: String
end
