class Passport
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :travel

  field :number, type: String
  field :expiry, type: Date
  field :issuing_body, type: String
end
