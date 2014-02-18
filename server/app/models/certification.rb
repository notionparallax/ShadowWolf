class Certification
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :environmental_sustainable_design

  field :name, type: String
  field :ranking, type: String
  field :awarding_body, type: String
  field :expiry_date, type: Date
end
