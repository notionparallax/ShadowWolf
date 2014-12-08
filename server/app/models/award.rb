class Award
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :legacy

  field :award, type: String
  field :date, type: Date
  field :jury, type: Array
  field :tags, type: Array, default: []
end
