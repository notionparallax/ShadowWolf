# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :key_date do
    date { (10..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    name { ["opening","incident","closing","collapse","demolition"].sample }
    description { "Disastrous" }
  end
end
