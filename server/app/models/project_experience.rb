class ProjectExperience
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :start_date, type: Date
  field :end_date, type: Date
  field :name, type: String
  field :firm, type: String
  field :role, type: String
  field :stage, type: String
  field :url, type: String
end
