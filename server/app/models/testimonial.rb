class Testimonial
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :legacy

  field :testimonial, type: String
  field :date, type: Date
  field :citation, type: String
end
