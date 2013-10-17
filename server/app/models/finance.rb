class Finance
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :employee_code, type: String
end
