class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :applicant

  accepts_nested_attributes_for :applicant

  embeds_one :person_contact

  accepts_nested_attributes_for :person_contact

  embeds_one :employee

  accepts_nested_attributes_for :employee

  embeds_one :person_name

  accepts_nested_attributes_for :person_name
end
