# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :key_date do
    start_date { (10..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    end_date { (0..10).to_a.sample.years.ago + (1..345).to_a.sample.days }
  end
end
