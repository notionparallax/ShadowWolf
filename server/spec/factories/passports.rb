# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :passport do
    number "MyString"
    expiry "2013-10-17"
    issuing_body "MyString"
  end
end
