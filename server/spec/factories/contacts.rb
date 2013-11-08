# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    mobile { FactoryGirl.build( :mobile ) }
  end
end
