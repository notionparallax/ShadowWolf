class Employee
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :conditions

  accepts_nested_attributes_for :conditions

  embeds_one :photo

  accepts_nested_attributes_for :photo

  embedded_in :person

end
