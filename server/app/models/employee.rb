class Employee
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :person, inverse_of: :employee

  embeds_one :biography, class_name: 'Biography'
end
