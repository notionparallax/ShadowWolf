class ApiKey
  include Mongoid::Document
  field :access_token, type: String

  has_one :person
  validates_presence_of :person

  def expired?
    self.created_at + 1.day < DateTime.now
  end
end
