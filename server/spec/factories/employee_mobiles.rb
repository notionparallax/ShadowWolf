# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_mobile do
    number { '04' + Faker::Number.number(8) }
    is_work { [true, false].sample }
    distribute { [true, false].sample }
  end
end
