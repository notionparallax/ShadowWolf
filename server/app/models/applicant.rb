class Applicant
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :applications

  accepts_nested_attributes_for :applications

  embedded_in :person

end
