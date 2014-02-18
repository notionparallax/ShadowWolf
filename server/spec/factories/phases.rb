# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phase do
    project_name { Faker::Commerce.product_name + " " + ["base", "tower", "building", "Labs"].sample}
    studio { ['Brisbane', 'Sydney', 'Canberra', 'Auckland', 'Bangkok', 'London', 'Melbourne', 'Townsville'].sample }
    client { Faker::Company.name }
    services_scope { Faker::Lorem.paragraphs.join('<br>') }
    delivery_contract { Faker::Lorem.paragraphs.join('<br>') }
    staff_contact_login { (Faker::Base::ULetters.sample + Faker::Name.last_name ).downcase }
    staff_custodian_login { (Faker::Base::ULetters.sample + Faker::Name.last_name ).downcase }
    start_date { (10..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    end_date { (0..10).to_a.sample.years.ago + (1..345).to_a.sample.days }
    initial_phase_value_total { (rand*100).floor*1000000 }
    final_phase_value_total { (rand*100).floor*1000000 }
    initial_phase_fee_total { (rand*100).floor*1000000 }
    final_phase_fee_total { (rand*100).floor*1000000 }
    construction_initial { (rand*100).floor*1000000 }
    construction_final { (rand*100).floor*1000000 }
    comments { Faker::Lorem.paragraphs.join('<br>') }
    fee_type { ["fixed fee", "lump sum", "hourly"].sample }
  end
end
