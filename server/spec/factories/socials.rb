# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :social do
    twitter { '@'+Faker::Lorem.word }
    instagram { '@'+Faker::Lorem.word }
    github { Faker::Lorem.word }
    pinterest { Faker::Lorem.word+Faker::Lorem.word }
    google_plus { 'https://plus.google.com/u/0/'+ Faker::Number.number(20) }
    linkedin { 'au.linkedin.com/pub/' + Faker::Name.first_name + '-' + Faker::Name.last_name + '/'+Faker::Number.digit+'a/258/933/' }
    facebook { (Faker::Name.first_name + Faker::Name.last_name+Faker::Number.digit).downcase }
    tumblr { 'http://tumblr.'+Faker::Lorem.word+Faker::Lorem.word+'.com/' }
  end
end
