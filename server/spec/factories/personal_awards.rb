# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :personal_award do
    name { Faker::Company.catch_phrase }
    awarding_body { Faker::Company.name + ' ' +['Society','Fellowship','Club'].sample }
    description { Faker::Lorem.paragraphs.join('<br>') }
    url { 'http://'+ Faker::Internet.domain_name + '/greatAward/' + ['pretty','amazing','clever'].sample }
  end
end
