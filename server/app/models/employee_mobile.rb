class EmployeeMobile
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee_contact

  field :number, type: String
  field :is_work, type: Boolean
  field :distribute, type: Boolean
end
