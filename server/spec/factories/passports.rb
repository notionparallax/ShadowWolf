# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :passport do
    number { ((Faker::Internet.password + (0..9).to_a.join().to_s).split('')).shuffle[0..12].join }
    expiry { (0..3).to_a.sample.years.from_now + (1..345).to_a.sample.days }
    issuing_body { ['Australia', 'Iceland', 'Luxemburg'].sample }
  end
end
