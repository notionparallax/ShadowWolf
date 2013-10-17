# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    organisation "MyString"
    membership_number "MyString"
    state "MyString"
    country "MyString"
  end
end
