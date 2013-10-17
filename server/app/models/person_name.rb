class PersonName
  include Mongoid::Document
  include Mongoid::Timestamps
  field :prefix, type: String
  field :first, type: String
  field :middle, type: String
  field :last, type: String
  field :suffix, type: String
  field :preferred_first, type: String
  field :preferred_last, type: String
end
