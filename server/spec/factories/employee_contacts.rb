# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_contact do
    mobile { FactoryGirl.build( :employee_mobile ) }
    extension "MyString"
    studio "MyString"
    work_email "MyString"
  end
end
