class PersonName
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :person, inverse_of: :name

  field :first, type: String
  field :last, type: String
  field :preferred_first, type: String
  field :preferred_last, type: String
end
