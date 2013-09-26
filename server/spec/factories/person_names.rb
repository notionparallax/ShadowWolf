# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person_name do
    first { Faker::Name.first_name }
    last { Faker::Name.last_name }
    preferred_first { Faker::Name.first_name }
    preferred_last { Faker::Name.last_name }
  end
end
