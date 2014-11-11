# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :award do
    award { Faker::Company.catch_phrase }
    date { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    jury { [Faker::Name.name,Faker::Name.name,Faker::Name.name ,Faker::Name.name] }
  end
end
