class GeoJson
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :location

  field :lat, type: Float
  field :lon, type: Float
  field :boundary_points, type: Array
end
