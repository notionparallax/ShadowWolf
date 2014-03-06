class Campaign
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :building_press

  field :strategy, type: String
end
