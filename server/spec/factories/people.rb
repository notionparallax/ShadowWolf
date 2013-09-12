# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    name { FactoryGirl.build( :person_name) }
    employee { FactoryGirl.build( :employee) }
  end
end
