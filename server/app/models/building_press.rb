class BuildingPress
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :campaigns

  accepts_nested_attributes_for :campaigns

  embeds_many :attentions, class_name: 'BuildingAttention'

  accepts_nested_attributes_for :attentions

  embedded_in :building, inverse_of: :presses

  embeds_many :press_releases, class_name: 'PressRelease'

  accepts_nested_attributes_for :press_releases

  after_initialize if: :new_record? do |doc|
    doc.attentions = [Attention.new]
    doc.campaigns = [Campaign.new]
    doc.press_releases = [PressRelease.new]
  end
end
