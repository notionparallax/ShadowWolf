# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :travel do
    after(:build) do |travel|
      FactoryGirl.build_list( :frequent_flier_program, [0,1,2,3,10].sample, travel: travel )
    end
    after(:build) do |travel|
      FactoryGirl.build_list( :passport, [0,1,2,3,10].sample, travel: travel )
    end
  end
end
