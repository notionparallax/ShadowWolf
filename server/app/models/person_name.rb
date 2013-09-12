class PersonName
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :person, inverse_of: :name

  field :first, type: String
  field :last, type: String
  field :middle, type: String
  field :preferred_first, type: String
  field :preferred_last, type: String

  validates_presence_of :first
  validates_presence_of :last
  validates_presence_of :preferred_first
  validates_presence_of :preferred_last
end
