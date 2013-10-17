class Applicant
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :person

end
