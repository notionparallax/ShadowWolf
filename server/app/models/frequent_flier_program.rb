class FrequentFlierProgram
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :travel

  field :name, type: String
  field :number, type: String
end
