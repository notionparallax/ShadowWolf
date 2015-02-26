FactoryGirl.define do
  factory :legacy_budget do
    budget { (1..9).to_a.sample * [100_000,1_000_000, 10_000_000].sample }
    description { ['Waterfront', 'Retail Area', 'Secret Military Base', 'Underground Science Lab'].sample }
    tags { ["main", %w(retail business residential).sample, %w(education health finance).sample] }
    confidential { [true,true,false].sample }
    currency { %w(AUD GBP USA).sample }
    date { [1,3,9].sample.years.ago }
  end
end
