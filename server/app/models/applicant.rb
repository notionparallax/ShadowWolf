class Applicant
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :application

  accepts_nested_attributes_for :application

  embedded_in :person

end
