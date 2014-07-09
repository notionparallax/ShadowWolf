class KeyDate
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :phase

  field :date, type: Date
  field :name, type: String
  field :description, type: String
end
