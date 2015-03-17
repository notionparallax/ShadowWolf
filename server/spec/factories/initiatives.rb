# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :initiative do
    title { ["wind turbine", "magic glass", "green roof"].sample }
    reason { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraphs(2).join('<br>') }
    tags { ["main", %w(retail business residential).sample, %w(education health finance).sample] }
  end
end
