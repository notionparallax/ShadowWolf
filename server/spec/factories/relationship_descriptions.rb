# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :relationship_description do
    client { Faker::Lorem.paragraphs.join('<br>') }
    stakeholder { Faker::Lorem.paragraphs.join('<br>') }
    councils { Faker::Lorem.paragraphs.join('<br>') }
  end
end
