# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    organisation "MyString"
    membership_number "MyString"
    state "MyString"
    country "MyString"
    expiry "2013-11-08"
  end
end
