class PersonContact
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :social

  accepts_nested_attributes_for :social

  embedded_in :person

  field :personal_email, type: String
  field :personal_phone, type: String
end
