class SecurityClearance
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :issuing_body, type: String
  field :level, type: String
  field :expiry, type: Date
end
