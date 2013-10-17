class Biography
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :one_line_bio, type: String
  field :approach, type: String
  field :expertise, type: String
  field :experience, type: String
  field :achievements, type: String
  field :value_statement, type: String
end
