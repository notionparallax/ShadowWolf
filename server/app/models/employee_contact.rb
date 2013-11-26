class EmployeeContact
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :mobile, class_name: 'EmployeeMobile'

  accepts_nested_attributes_for :mobile

  embedded_in :employee, inverse_of: :contact

  field :extension, type: String
  field :studio, type: String
  field :work_email, type: String
end
