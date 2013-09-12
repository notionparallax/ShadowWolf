class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :name, class_name: 'PersonName'
  embeds_one :employee, class_name: 'Employee'

  validates_presence_of :name
  validates_presence_of :employee

  accepts_nested_attributes_for :name
  accepts_nested_attributes_for :employee
end
