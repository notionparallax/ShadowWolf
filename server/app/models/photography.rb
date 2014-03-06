class Photography
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :legacy

  field :photographer, type: String
  field :date, type: Date
end
