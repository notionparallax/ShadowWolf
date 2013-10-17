class Qualification
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :name, type: String
  field :level, type: String
  field :institution, type: String
  field :first_year, type: Integer
  field :last_year, type: Integer
end
