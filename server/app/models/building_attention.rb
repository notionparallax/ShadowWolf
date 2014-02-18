class BuildingAttention
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :building_press

  field :date, type: Date
  field :url, type: String
  field :scan_or_screengrab, type: String
  field :body_text, type: String
  field :publication, type: String
  field :reason, type: String
end
