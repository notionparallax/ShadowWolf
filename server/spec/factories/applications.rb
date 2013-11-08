# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application do
    date "2013-10-18"
    covering_letter "MyString"
    portfolio "MyString"
    assessment "MyText"
    future_consideration false
    skills_and_keywords "MyText"
  end
end
