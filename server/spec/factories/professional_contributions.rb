# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :professional_contribution do
    activity { Faker::Company.catch_phrase }
    description { Faker::Lorem.paragraphs.join('<br>') }
    url { 'http://'+ Faker::Internet.domain_name + '/greatAward/' + ['pretty','amazing','clever'].sample }
  end
end
