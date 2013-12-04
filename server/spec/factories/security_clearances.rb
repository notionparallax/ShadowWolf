# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :security_clearance do
    issuing_body { ['Army','Navy','Airforce', 'Police', 'Scooby Doo gang', 'CIA', 'FBI', 'MI6', 'MI5', 'ASIO'].sample }
    level { ['Top Secret', 'Licence to Kill', 'Double Secret Probation', 'Baseline'].sample }
    expiry { (0..3).to_a.sample.years.from_now + (1..345).to_a.sample.days }
  end
end
