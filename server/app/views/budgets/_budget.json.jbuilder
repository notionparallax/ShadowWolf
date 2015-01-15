json.id budget.id
json.extract! budget, :created_at, :updated_at, :initial_phase_value_total, :final_phase_value_total, :initial_phase_fee_total, :final_phase_fee_total, :construction_initial, :construction_final, :comments, :fee_type, :dirty_budget, :confidential
