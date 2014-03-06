# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photography do
    photographer { Faker::Name.name  }
    date { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
  end
end
