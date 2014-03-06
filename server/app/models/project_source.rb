class ProjectSource
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :referred_by

  accepts_nested_attributes_for :referred_by

  embedded_in :building

  field :competition_win, type: Boolean
  field :competition_URL, type: String
end
