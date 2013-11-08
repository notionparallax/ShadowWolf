class Travel
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :frequent_flier_program

  accepts_nested_attributes_for :frequent_flier_program

  embeds_many :passport

  accepts_nested_attributes_for :passport

  embedded_in :employee

end
