class Initiative
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :environmental_sustainable_design
  embedded_in :legacy

  field :title, type: String
  field :reason, type: String
  field :description, type: String
end
