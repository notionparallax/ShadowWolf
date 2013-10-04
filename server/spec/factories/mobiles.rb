# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mobile do
    number { "04" + Faker::Number.number(8).to_s }
    is_bvn { [true,false].sample }
    distribute { [true,false].sample }
  end
end
