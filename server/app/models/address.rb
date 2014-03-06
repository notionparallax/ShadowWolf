class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :location

  field :building_name, type: String
  field :street_number, type: String
  field :street, type: String
  field :suburb_area, type: String
  field :state_county, type: String
  field :country, type: String
  field :postcode, type: String
end
