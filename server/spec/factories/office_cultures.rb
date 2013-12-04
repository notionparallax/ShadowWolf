# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :office_culture do
    dietary { FactoryGirl.build( :dietary ) }
    after(:build) do |office_culture|
      FactoryGirl.build_list( :event_participation, [0,1,2,3,10].sample, office_culture: office_culture )
    end
    first_aider { [true, false].sample }
    fire_warden { [true, false].sample }
  end
end
