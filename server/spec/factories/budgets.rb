# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :budget do
    initial_phase_value_total { (rand*100).floor*1000000 }
    final_phase_value_total { (rand*100).floor*1000000 }
    initial_phase_fee_total { (rand*100).floor*1000000 }
    final_phase_fee_total { (rand*100).floor*1000000 }
    construction_initial { (rand*100).floor*1000000 }
    construction_final { (rand*100).floor*1000000 }
    comments { Faker::Lorem.paragraphs.join('<br>') }
    fee_type { ["fixed fee", "lump sum", "hourly"].sample }
    dirty_budget "a cool mil"
  end
end
