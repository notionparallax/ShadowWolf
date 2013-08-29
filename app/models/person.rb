class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :person_name

end
