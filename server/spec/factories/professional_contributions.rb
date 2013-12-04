# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :professional_contribution do
    activity { Faker::Company.catch_phrase }
    description { Faker::Lorem.paragraphs.join('<br>') }
    url { 'http://'+ Faker::Internet.domain_name + '/greatAward/' + ['pretty','amazing','clever'].sample }
    date { (0..20).to_a.sample.years.ago.to_s }
  end
end
