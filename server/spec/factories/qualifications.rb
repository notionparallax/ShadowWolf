# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :qualification do
    name { Faker::Name.title + " studies" }
    level { ['High school', 'Batchelors', 'Masters', 'Doctoral' ].sample }
    institution { Faker::Name.first_name + ' ' + ['Institute','College','University'].sample }
    first_year { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    last_year { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days + (0..3).to_a.sample.years }
  end
end
