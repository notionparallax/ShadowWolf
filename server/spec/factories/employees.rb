# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    after(:create) do |employee|
      FactoryGirl.create_list(:condition, 3, employee: employee)
    end
    photo { FactoryGirl.build( :photo ) }
  end
end
