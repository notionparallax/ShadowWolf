class Mobile
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :contact

end
