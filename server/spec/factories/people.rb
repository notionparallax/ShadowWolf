# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    applicant { FactoryGirl.build( :applicant ) }
    person_contact { FactoryGirl.build( :person_contact ) }
    employee { FactoryGirl.build( :employee ) }
    person_name { FactoryGirl.build( :person_name ) }
  end
end
