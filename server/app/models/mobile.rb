class Mobile
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :contact

  field :number, type: String
  field :is_bvn, type: Boolean
  field :distribute, type: Boolean
end
