class Condition
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :name, type: String
  field :start_date, type: Date
  field :end_date, type: Date
end
