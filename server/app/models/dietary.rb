class Dietary
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :office_culture

  field :requirements, type: Array, default: []
  field :likes, type: Array, default: []
  field :dislikes, type: Array, default: []
end
