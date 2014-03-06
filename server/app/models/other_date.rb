class OtherDate
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :key_date

  field :date, type: Date
  field :description, type: String
end
