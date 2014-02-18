# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phase do
    budget { FactoryGirl.build( :budget ) }
    key_date { FactoryGirl.build( :key_date ) }
    project_name { Faker::Commerce.product_name + " " + ["base", "tower", "building", "Labs"].sample}
    studio { ['Brisbane', 'Sydney', 'Canberra', 'Auckland', 'Bangkok', 'London', 'Melbourne', 'Townsville'].sample }
    client { Faker::Company.name }
    services_scope { Faker::Lorem.paragraphs.join('<br>') }
    delivery_contract { Faker::Lorem.paragraphs.join('<br>') }
    staff_contact_login { (Faker::Base::ULetters.sample + Faker::Name.last_name ).downcase }
    staff_custodian_login { (Faker::Base::ULetters.sample + Faker::Name.last_name ).downcase }
  end
end
