class KeyDate
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :phase

  field :start_date, type: Date
  field :end_date, type: Date
end
