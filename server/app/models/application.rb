class Application
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :application


  embeds_many :applications

  accepts_nested_attributes_for :applications
  field :date, type: Date
  field :covering_letter, type: String
  field :portfolio, type: String
  field :assessment, type: String
  field :future_consideration, type: Boolean
  field :skills_and_keywords, type: String
end
