# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :condition do
    name { ['Active', 'Retired', 'Maternity', 'Leave', 'Deceased' , 'Left'].sample }
    start_date { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    end_date { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days + (0..3).to_a.sample.years }
  end
end
