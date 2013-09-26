# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    employee { FactoryGirl.build( :employee ) }
    name { FactoryGirl.build( :person_name ) }
  end
end
