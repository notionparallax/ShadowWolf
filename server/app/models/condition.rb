class Condition
  include Mongoid::Document
  include Mongoid::Timestamps

validates_uniqueness_of :start_date, scope: :person
validates :name, inclusion: { in: ['Active', 'Retired', 'Maternity', 'Leave', 'Deceased', 'Applicant', 'Left', 'Unknown', nil] }

  embedded_in :person

  field :name, type: String, default: 'Unknown'
  field :start_date, type: Date, default: DateTime.now
end
