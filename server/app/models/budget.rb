class Budget
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :phase

  field :initial_phase_value_total, type: Double
  field :final_phase_value_total, type: Double
  field :initial_phase_fee_total, type: Double
  field :final_phase_fee_total, type: Double
  field :construction_initial, type: Double
  field :construction_final, type: Double
  field :comments, type: String
  field :fee_type, type: String
end
