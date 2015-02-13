class Location
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :address

  accepts_nested_attributes_for :address

  embeds_one :geo_json

  accepts_nested_attributes_for :geo_json

  embedded_in :building

  after_initialize if: :new_record? do |doc|
    doc.address = Address.new
    doc.geo_json = GeoJson.new
  end
end
