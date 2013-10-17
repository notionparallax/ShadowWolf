# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dietary do
    preference { FactoryGirl.build( :preference ) }
    requirements "MyText"
  end
end
