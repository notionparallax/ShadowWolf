# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dietary do
    preference { FactoryGirl.build( :preference ) }
    requirements { ['Gluten free','Hindu ','Kosher ','Vegan ','Vegetarian ','Jain','Paleo','None', 'Bland'].sample(3).join(', ') }
  end
end
