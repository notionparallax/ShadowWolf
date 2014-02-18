# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    after(:build) do |campaign|
      FactoryGirl.build_list( :building_press_release, [0,1,2,3,10].sample, campaign: campaign )
    end
    strategy { Faker::Lorem.paragraphs.join('<br>') }
  end
end
