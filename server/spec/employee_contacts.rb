# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_contact do
    extension "MyString"
    studio "MyString"
    work_email "MyString"
  end
end
