# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attention do
    date "2013-10-17"
    url "MyString"
    scan_or_screengrab "MyString"
    body_text "MyText"
    publication "MyString"
    reason "MyString"
  end
end
