# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building_press do
    after(:build) do |building_press|
      FactoryGirl.build_list( :campaign, [0,1,2,3,10].sample, building_press: building_press )
    end
    after(:build) do |building_press|
      FactoryGirl.build_list( :building_attention, [0,1,2,3,10].sample, building_press: building_press )
    end
  end
end
