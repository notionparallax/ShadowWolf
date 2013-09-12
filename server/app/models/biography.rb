class Biography
  include Mongoid::Document
  
  embedded_in :employee, inverse_of: :biography

  field :one_line_bio, type: String
  field :your_approach, type: String
  field :expertise, type: String
  field :key_experience, type: String
  field :achievements, type: String
  field :value_statement, type: String
end
