class PersonName
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :person

  field :first_name, type: String
  field :last_name, type: String
  field :middle_name, type: String
  field :preferred_first_name, type: String
  field :preferred_last_name, type: String
end
