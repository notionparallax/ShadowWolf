# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_press do
    after(:build) do |employee_press|
      FactoryGirl.build_list( :attention, [0,1,2,3,10].sample, employee_press: employee_press )
    end
  end
end
