# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :key_date do
    after(:build) do |key_date|
      FactoryGirl.build_list( :other_date, [0,1,2,3,10].sample, key_date: key_date )
    end
    start_date { (10..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    end_date { (0..10).to_a.sample.years.ago + (1..345).to_a.sample.days }
  end
end
