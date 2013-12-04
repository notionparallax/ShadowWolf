class Travel
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :frequent_flier_programs

  accepts_nested_attributes_for :frequent_flier_programs

  embeds_many :passports

  accepts_nested_attributes_for :passports

  embedded_in :employee

end
