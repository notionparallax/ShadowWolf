class Extra
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :building

  field :label, type: String
  field :quantity, type: Float
  field :tags, type: Array, default: []

end
