# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :registration do
    organisation "MyString"
    registration_number "MyString"
    state "MyString"
    country "MyString"
  end
end
