# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :award do
    award { Faker::Company.catch_phrase }
    date  { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    jury  { Faker::Lorem.paragraphs }
    tags  { [%w(retail business residential).sample, %w(education health finance).sample] }
  end
end
