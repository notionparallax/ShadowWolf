# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :office_culture do
    dietary { FactoryGirl.build( :dietary ) }
    after(:create) do |office_culture|
      FactoryGirl.create_list( :event_participation, 3, office_culture: office_culture )
    end
    first_aider { [true, false].sample }
    fire_warden { [true, false].sample }
  end
end
