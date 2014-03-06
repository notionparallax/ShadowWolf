# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    strategy { Faker::Lorem.paragraphs.join('<br>') }
  end
end
