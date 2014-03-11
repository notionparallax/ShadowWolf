class Phase
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :budget

  accepts_nested_attributes_for :budget

  embeds_many :key_dates

  accepts_nested_attributes_for :key_dates

  embedded_in :building

  field :dirty_members, type: String
  field :project_name, type: String
  field :studio, type: String
  field :client, type: String
  field :services_scope, type: String
  field :delivery_contract, type: String
  field :staff_contact_login, type: String
  field :staff_custodian_login, type: String
  field :dirty_date, type: String
end
