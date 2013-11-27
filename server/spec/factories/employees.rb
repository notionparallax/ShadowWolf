# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    press { FactoryGirl.build( :press ) }
    biography { FactoryGirl.build( :biography ) }
    after(:build) do |employee|
      FactoryGirl.build_list( :project_experience, [0,1,2,3,10].sample, employee: employee )
    end
    travel { FactoryGirl.build( :travel ) }
    after(:build) do |employee|
      FactoryGirl.build_list( :professional_contribution, [0,1,2,3,10].sample, employee: employee )
    end
    after(:build) do |employee|
      FactoryGirl.build_list( :personal_award, [0,1,2,3,10].sample, employee: employee )
    end
    after(:build) do |employee|
      FactoryGirl.build_list( :membership, [0,1,2,3,10].sample, employee: employee )
    end
    after(:build) do |employee|
      FactoryGirl.build_list( :registration, [0,1,2,3,10].sample, employee: employee )
    end
    after(:build) do |employee|
      FactoryGirl.build_list( :qualification, [0,1,2,3,10].sample, employee: employee )
    end
    finance { FactoryGirl.build( :finance ) }
    after(:build) do |employee|
      FactoryGirl.build_list( :security_clearance, [0,1,2,3,10].sample, employee: employee )
    end
    contact { FactoryGirl.build( :employee_contact ) }
    office_culture { FactoryGirl.build( :office_culture ) }
    after(:build) do |employee|
      FactoryGirl.build_list( :condition, [0,1,2,3,10].sample, employee: employee )
    end
    photo { FactoryGirl.build( :photo ) }
    login { (Faker::Base::ULetters.sample + Faker::Name.last_name ).downcase }
    position { Faker::Name.title }
  end
end
