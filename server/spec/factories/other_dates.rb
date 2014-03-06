# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :other_date do
    date { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    description { Faker::Company.catch_phrase }
  end
end
