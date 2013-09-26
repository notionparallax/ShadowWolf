# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :condition do
    d = Proc.new { (10..20).to_a.sample.years }
    name "employed"
    start_date { d.call.ago }
    end_date { (d.call - (0..10).to_a.sample.years).ago }
  end
end
