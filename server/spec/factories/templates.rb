# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template do
    title { ["one line bio","value add","i don't know, make pretend"].sample }
    text { Faker::Lorem.sentence }
    tags { ["main", %w(retail business residential).sample, %w(education health finance).sample] }
  end
end
