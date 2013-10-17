# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    press { FactoryGirl.build( :press ) }
    office_culture { FactoryGirl.build( :office_culture ) }
    biography { FactoryGirl.build( :biography ) }
    after(:create) do |employee|
      FactoryGirl.create_list(:project_experience, 3, employee: employee)
    end
    travel { FactoryGirl.build( :travel ) }
    after(:create) do |employee|
      FactoryGirl.create_list(:professional_contribution, 3, employee: employee)
    end
    after(:create) do |employee|
      FactoryGirl.create_list(:personal_award, 3, employee: employee)
    end
    after(:create) do |employee|
      FactoryGirl.create_list(:membership, 3, employee: employee)
    end
    after(:create) do |employee|
      FactoryGirl.create_list(:registration, 3, employee: employee)
    end
    after(:create) do |employee|
      FactoryGirl.create_list(:qualification, 3, employee: employee)
    end
    finance { FactoryGirl.build( :finance ) }
    after(:create) do |employee|
      FactoryGirl.create_list(:security_clearance, 3, employee: employee)
    end
    contact { FactoryGirl.build( :employee_contact ) }
    login "MyString"
    position "MyString"
  end
end
