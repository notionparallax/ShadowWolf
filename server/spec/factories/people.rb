# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    applicant { FactoryGirl.build( :applicant ) }
    contact { FactoryGirl.build( :person_contact ) }
    after(:build) do |person|
      FactoryGirl.build_list( :condition, [0,1,2,3,10].sample, person: person )
    end
    employee { FactoryGirl.build( :employee ) }
    name { FactoryGirl.build( :person_name ) }
  end
end
