# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_participation do
    name { ['gong', 'beach', 'charlie', 'Biggest',     'very posh', 'shark island', 'extreme', 'nuts and berries'].sample + ' '+ ['ride', 'walk','party','fund raiser', 'gala', 'swim', 'bake off', 'trail'].sample  }
    date { (0..10).to_a.sample.years.ago + (1..345).to_a.sample.days }
    url { 'http://'+ Faker::Internet.domain_name + '/greatAward/' + ['event','registration','party'].sample }
  end
end
