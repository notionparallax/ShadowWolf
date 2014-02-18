# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :environmental_sustainable_design do
    after(:build) do |environmental_sustainable_design|
      FactoryGirl.build_list( :certification, [0,1,2,3,10].sample, environmental_sustainable_design: environmental_sustainable_design )
    end
    after(:build) do |environmental_sustainable_design|
      FactoryGirl.build_list( :initiative, [0,1,2,3,10].sample, environmental_sustainable_design: environmental_sustainable_design )
    end
  end
end
