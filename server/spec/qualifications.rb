# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :qualification do
    name "MyString"
    level "MyString"
    institution "MyString"
    first_year 1
    last_year 1
  end
end
