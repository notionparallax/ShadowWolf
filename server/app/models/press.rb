class Press
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :attentions

  accepts_nested_attributes_for :attentions

  embedded_in :employee

end
