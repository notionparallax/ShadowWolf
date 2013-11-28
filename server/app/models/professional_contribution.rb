class ProfessionalContribution
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :activity, type: String
  field :description, type: String
  field :url, type: String
  field :date, type: String
end
