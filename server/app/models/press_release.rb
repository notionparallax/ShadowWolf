class PressRelease
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :building_press, inverse_of: :press_releases

  field :date,  type: String
  field :title, type: String
  field :body,  type: String

end
