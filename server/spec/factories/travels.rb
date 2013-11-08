# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :travel do
    after(:create) do |travel|
      FactoryGirl.create_list( :frequent_flier_program, 3, travel: travel )
    end
    after(:create) do |travel|
      FactoryGirl.create_list( :passport, 3, travel: travel )
    end
  end
end
