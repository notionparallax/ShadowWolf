# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :certification do
    name { ["NABERS", "GBCA", "Carbon Buzz"].sample + ["designed", "built", "imagined"].sample}
    ranking { ["***", "****", "******"].sample }
    awarding_body { ["NABERS", "GBCA", "Carbon Buzz"].sample }
    expiry_date { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    tags { [%w(retail business residential).sample, %w(education health finance).sample] }
  end
end
