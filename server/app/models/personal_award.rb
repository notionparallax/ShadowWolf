class PersonalAward
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :name, type: String
  field :awarding_body, type: String
  field :description, type: String
  field :url, type: String
end
