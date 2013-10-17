class Preference
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :dietary

  field :likes, type: String
  field :dislikes, type: String
end
