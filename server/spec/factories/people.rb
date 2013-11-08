# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    applicant { FactoryGirl.build( :applicant ) }
    contact { FactoryGirl.build( :person_contact ) }
    name { FactoryGirl.build( :person_name ) }
    employee { FactoryGirl.build( :employee ) }
  end
end
