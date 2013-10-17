# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    applicant { FactoryGirl.build( :applicant ) }
    contact { FactoryGirl.build( :person_contact ) }
  end
end
