# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    organisation { Faker::Name.first_name + ' ' + ['Society','Fellowship','Club'].sample }
    membership_number { ((Faker::Internet.password + (0..9).to_a.join().to_s).split('')).shuffle[0..5].join }
    state { ['NSW', 'NT', 'ACT', 'VIC', 'WA'].sample }
    country { ['Australia', 'Iceland', 'Luxemburg'].sample }
    expiry { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
  end
end
