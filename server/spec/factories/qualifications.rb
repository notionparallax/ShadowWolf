# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :qualification do
    name { Faker::Name.title + " studies" }
    level { ['High school', 'Batchelors', 'Masters', 'Doctoral' ].sample }
    institution { Faker::Name.first_name + ' ' + ['Institute','College','University'].sample }
    first_year { (0..20).to_a.sample.years.ago.year }
    last_year { (0..20).to_a.sample.years.ago.year }
  end
end
