# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :press do
    after(:build) do |press|
      FactoryGirl.build_list( :attention, [0,1,2,3,10].sample, press: press )
    end
  end
end
