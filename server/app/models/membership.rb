class Membership
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :organisation, type: String
  field :membership_number, type: String
  field :state, type: String
  field :country, type: String
  field :expiry, type: Date
end
