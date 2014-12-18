# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phase do
    budget { FactoryGirl.build( :budget ) }
    after(:build) do |phase|
      FactoryGirl.build_list( :key_date, [0,1,2,3,10].sample, phase: phase )
    end
    dirty_members         { [Faker::Name.first_name,Faker::Name.first_name,Faker::Name.first_name].join ', ' }
    project_name          { Faker::Commerce.product_name + " " + ["base", "tower", "building", "Labs"].sample}
    studio                { ['Brisbane', 'Sydney', 'Canberra', 'Auckland', 'Bangkok', 'London', 'Melbourne', 'Townsville'].sample }
    client                { Faker::Company.name }
    services_scope        { Faker::Lorem.paragraph }
    delivery_contract     { Faker::Lorem.paragraphs.join('<br>') }
    staff_contact_login   { (Faker::Base::ULetters.sample + Faker::Name.last_name ).downcase }
    staff_custodian_login { (Faker::Base::ULetters.sample + Faker::Name.last_name ).downcase }
    dirty_date "Projected completion 2005"
    referee { "Pierluigi Collina" }
    dirty_finish { 'Around ' + 1.day.ago.to_s }
  end
end
