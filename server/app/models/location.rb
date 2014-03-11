class Location
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :addresses

  accepts_nested_attributes_for :addresses

  embeds_one :geo_json

  accepts_nested_attributes_for :geo_json

  embedded_in :building

end
