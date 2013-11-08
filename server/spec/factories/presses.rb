# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :press do
    after(:create) do |press|
      FactoryGirl.create_list( :attention, 3, press: press )
    end
  end
end
