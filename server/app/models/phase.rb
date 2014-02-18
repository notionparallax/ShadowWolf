class Phase
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :building

  field :project_name, type: String
  field :studio, type: String
  field :client, type: String
  field :services_scope, type: String
  field :delivery_contract, type: String
  field :staff_contact_login, type: String
  field :staff_custodian_login, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :initial_phase_value_total, type: Float
  field :final_phase_value_total, type: Float
  field :initial_phase_fee_total, type: Float
  field :final_phase_fee_total, type: Float
  field :construction_initial, type: Float
  field :construction_final, type: Float
  field :comments, type: String
  field :fee_type, type: String
end
