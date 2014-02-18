# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :net_lettable_area do
    measurement { rand * 80000  }
    standard_name { ["BC", "IOS", "RM"].sample +  ["USA", "Au", "UK"].sample}
    standard_version { "V"+(1..5)to_a.sample }
  end
end
