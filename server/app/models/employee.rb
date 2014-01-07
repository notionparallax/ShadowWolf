class Employee
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :press

  accepts_nested_attributes_for :press

  embeds_one :biography

  accepts_nested_attributes_for :biography

  embeds_many :project_experiences

  accepts_nested_attributes_for :project_experiences

  embeds_one :travel

  accepts_nested_attributes_for :travel

  embeds_many :professional_contributions

  accepts_nested_attributes_for :professional_contributions

  embeds_many :personal_awards

  accepts_nested_attributes_for :personal_awards

  embeds_many :memberships

  accepts_nested_attributes_for :memberships

  embeds_many :registrations

  accepts_nested_attributes_for :registrations

  embeds_many :qualifications

  accepts_nested_attributes_for :qualifications

  embeds_one :finance

  accepts_nested_attributes_for :finance

  embeds_many :security_clearances

  accepts_nested_attributes_for :security_clearances

  embeds_one :contact, class_name: 'EmployeeContact'

  accepts_nested_attributes_for :contact

  embeds_one :office_culture

  accepts_nested_attributes_for :office_culture

  embeds_one :photo

  accepts_nested_attributes_for :photo

  embedded_in :person

  field :login, type: String
  field :position, type: String
end
