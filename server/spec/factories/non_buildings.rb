# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :non_building do
    name { Faker::Company.bs }
    description { Faker::Lorem.paragraphs(2).join('<br>') }
  end
end
