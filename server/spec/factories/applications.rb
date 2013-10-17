# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application do
    after(:create) do |application|
      FactoryGirl.create_list(:application, 3, application: application)
    end
    date "2013-10-17"
    covering_letter "MyString"
    portfolio "MyString"
    assessment "MyText"
    future_consideration false
    skills_and_keywords "MyText"
  end
end
