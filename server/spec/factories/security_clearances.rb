# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :security_clearance do
    issuing_body "MyString"
    level "MyString"
    expiry "2013-10-17"
  end
end
