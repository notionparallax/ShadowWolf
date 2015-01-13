class Referee
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :client, inverse_of: :referees

  field :description, type: String
  field :details,     type: String
end
