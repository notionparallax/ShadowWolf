# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :referee do
    description { Faker::Commerce.product_name + " " + Faker::Name.last_name }
    details     { Faker::Lorem.paragraphs(1) }
  end
end
