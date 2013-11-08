# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_mobile do
    number "MyString"
    is_work false
    distribute false
  end
end
