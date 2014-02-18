class GeoJson
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :location

  field :lat, type: Double
  field :lon, type: Double
  field :boundary_points, type: Array
end
