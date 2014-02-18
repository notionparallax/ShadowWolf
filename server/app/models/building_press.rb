class BuildingPress
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :campaigns

  accepts_nested_attributes_for :campaigns

  embeds_many :building_attentions

  accepts_nested_attributes_for :building_attentions

  embedded_in :building

end
