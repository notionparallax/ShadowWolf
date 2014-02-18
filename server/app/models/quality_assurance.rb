class QualityAssurance
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :building, inverse_of: :qas

  field :notes, type: String
end
