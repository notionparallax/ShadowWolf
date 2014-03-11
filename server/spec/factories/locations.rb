# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    after(:build) do |location|
      FactoryGirl.build_list( :address, [0,1,2,3,10].sample, location: location )
    end
    geo_json { FactoryGirl.build( :geo_json ) }
  end
end
