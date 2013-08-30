class PersonName
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :person, inverse_of: :name

  field :first_name, type: String
  field :last_name, type: String
  field :middle_name, type: String
  field :preferred_first_name, type: String
  field :preferred_last_name, type: String

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :preferred_first_name
  validates_presence_of :preferred_last_name
end
