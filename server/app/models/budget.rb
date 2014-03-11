class Budget
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :phase

  field :initial_phase_value_total, type: Float
  field :final_phase_value_total, type: Float
  field :initial_phase_fee_total, type: Float
  field :final_phase_fee_total, type: Float
  field :construction_initial, type: Float
  field :construction_final, type: Float
  field :comments, type: String
  field :fee_type, type: String
  field :dirty_budget, type: String
end
