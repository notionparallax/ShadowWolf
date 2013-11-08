# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person_name do
    prefix "MyString"
    first "MyString"
    middle "MyString"
    last "MyString"
    suffix "MyString"
    preferred_first "MyString"
    preferred_last "MyString"
  end
end
