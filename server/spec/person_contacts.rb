# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person_contact do
    personal_email "MyString"
    personal_phone "MyString"
  end
end
