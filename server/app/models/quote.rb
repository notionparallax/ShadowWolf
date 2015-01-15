class Quote
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :legacy

  field :quote, type: String
  field :date, type: Date
  field :citation, type: String
  field :context, type: String
  field :tags, type: Array, default: []
end
