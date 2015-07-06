class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :location

  field :dirty_location, type: String
  field :building_name, type: String
  field :street_number, type: String
  field :street, type: String
  field :suburb_area, type: String
  field :state_county, type: String
  field :country, type: String
  field :postcode, type: String
  field :tags, type: Array, default: []
end
