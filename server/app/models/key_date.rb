class KeyDate
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :other_dates

  accepts_nested_attributes_for :other_dates

  embedded_in :phase

  field :start_date, type: Date
  field :end_date, type: Date
end
