# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :height do
    measurement { rand * 800 }
    standard_name { ["Highest occupied floor", "top of radio mast"].sample }
    standard_version { "V"+(1..5).to_a.sample.to_s }
  end
end
