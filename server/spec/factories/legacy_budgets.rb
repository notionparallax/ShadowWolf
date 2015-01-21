FactoryGirl.define do
  factory :legacy_budget do
    budget { (1..9).to_a.sample * [100_000,1_000_000, 10_000_000].sample }
    description { ['Waterfront', 'Retail Area', 'Secret Military Base', 'Underground Science Lab'].sample }
    tags { [%w(retail business residential).sample, %w(education health finance).sample] }
  end
end
