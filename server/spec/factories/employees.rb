# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    biography { FactoryGirl.build( :biography ) }
  end
end
