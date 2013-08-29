class Person
  include Mongoid::Document

  embeds_one :person_name

end
