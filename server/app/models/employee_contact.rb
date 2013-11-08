class EmployeeContact
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee


  embeds_one :employee_mobile

  accepts_nested_attributes_for :employee_mobile
  field :extension, type: String
  field :studio, type: String
  field :work_email, type: String
end
