class LegacyBudget
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :legacy

  field :budget, type: Integer
  field :description, type: String
  field :tags, type: Array, default: []
end
