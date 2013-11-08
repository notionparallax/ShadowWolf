class Employee
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :contact

  accepts_nested_attributes_for :contact

  embeds_one :press

  accepts_nested_attributes_for :press

  embeds_one :biography

  accepts_nested_attributes_for :biography

  embeds_many :project_experience

  accepts_nested_attributes_for :project_experience

  embeds_one :travel

  accepts_nested_attributes_for :travel

  embeds_many :professional_contribution

  accepts_nested_attributes_for :professional_contribution

  embeds_many :personal_award

  accepts_nested_attributes_for :personal_award

  embeds_many :membership

  accepts_nested_attributes_for :membership

  embeds_many :registration

  accepts_nested_attributes_for :registration

  embeds_many :qualification

  accepts_nested_attributes_for :qualification

  embeds_one :finance

  accepts_nested_attributes_for :finance

  embeds_many :security_clearance

  accepts_nested_attributes_for :security_clearance

  embeds_one :employee_contact

  accepts_nested_attributes_for :employee_contact

  embeds_one :office_culture

  accepts_nested_attributes_for :office_culture

  embeds_many :condition

  accepts_nested_attributes_for :condition

  embeds_one :photo

  accepts_nested_attributes_for :photo

  embedded_in :person

  field :login, type: String
  field :position, type: String
end
