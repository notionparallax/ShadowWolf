# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person_name do
    first_name 				    { Faker::Name.first_name }
    last_name 				    { Faker::Name.last_name }
    preferred_first_name  { Faker::Name.first_name }
    preferred_last_name 	{ Faker::Name.last_name }
    middle_name 				  { Faker::Name.first_name }
  end
end
