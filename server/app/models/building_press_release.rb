class BuildingPressRelease
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :campaign

  field :date, type: Date
  field :channel_list, type: String
  field :content, type: String
  field :author_login, type: String
end
