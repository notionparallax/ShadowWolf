class EventParticipation
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :office_culture

  field :name, type: String
  field :date, type: Date
  field :url, type: String
end
