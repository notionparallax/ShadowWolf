class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :employee

  accepts_nested_attributes_for :employee

  embeds_one :name, class_name: 'PersonName'

  accepts_nested_attributes_for :name
end
