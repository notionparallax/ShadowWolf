# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quality_assurance do
    notes { Faker::Lorem.paragraphs.join('<br>') }
  end
end
