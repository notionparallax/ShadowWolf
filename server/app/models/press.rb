class Press
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :attention

  accepts_nested_attributes_for :attention

  embedded_in :employee

end
