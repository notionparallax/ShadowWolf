class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :employee

  field :fun, type: String
  field :bw, type: String
  field :colour, type: String
end
