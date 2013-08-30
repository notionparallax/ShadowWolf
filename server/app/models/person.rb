class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :name, class_name: 'PersonName'

  validates_presence_of :name

  accepts_nested_attributes_for :name
end
