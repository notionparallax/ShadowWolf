class Template
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :legacy, inverse_of: :templates

  field :title, type: String
  field :text, type: String
  field :tags, type: Array, default: []
end
