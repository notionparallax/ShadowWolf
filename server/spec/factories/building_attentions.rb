# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building_attention do
    date { (0..10).to_a.sample.years.ago + (1..345).to_a.sample.days }
    url { 'http://'+ Faker::Internet.domain_name + '/stories/' + ['style_section','business','theatre'].sample }
    scan_or_screengrab { 'http://'+ Faker::Internet.domain_name + '/images/' + Faker::Number.number(20) + 'screencap.jpg' }
    body_text { Faker::Lorem.paragraphs(paragraph_count = 8).join('<br>') }
    publication { Faker::Company.bs + ' weekly' }
    reason { ['reactive', 'planned', 'response to release'].sample }
  end
end
