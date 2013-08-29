class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :person_name, store_as: "name"

  validates_presence_of :person_name
end
