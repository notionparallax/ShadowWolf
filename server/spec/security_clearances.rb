# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :security_clearance do
    issuing_body "MyString"
    level "MyString"
    expiry "2013-11-08"
  end
end
