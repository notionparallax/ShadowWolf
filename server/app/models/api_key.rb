class ApiKey
  include Mongoid::Document
  include Mongoid::Timestamps

  before_create :generate_access_token

  field :access_token, type: String

  belongs_to :person
  #validates_presence_of :person

  def expired?
    self.created_at + 1.day < DateTime.now
  end

  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while ApiKey.where( access_token: access_token ).first
  end
end
