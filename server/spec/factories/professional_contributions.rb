# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :professional_contribution do
    activity "MyString"
    description "MyText"
    url "MyString"
  end
end
