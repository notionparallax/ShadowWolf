class BriefElement
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  field :tags, type: Array, default: []

  embedded_in :building, inverse_of: :brief_elements
end
