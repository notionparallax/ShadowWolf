# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :initiative do
    title { ["wind turbine", "magic glass", "green roof"].sample }
    reason { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraphs(2).join('<br>') }
  end
end
