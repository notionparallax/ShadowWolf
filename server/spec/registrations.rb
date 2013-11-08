# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :registration do
    organisation "MyString"
    registration_number "MyString"
    state "MyString"
    country "MyString"
    expiry "2013-11-08"
  end
end
