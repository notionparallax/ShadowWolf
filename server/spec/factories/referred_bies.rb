# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :referred_by do
    BVN_staff_login { (Faker::Base::ULetters.sample + Faker::Name.last_name ).downcase }
    contact_name { Faker::Name.name }
    contact_organisation { Faker::Name.name + "Institute" }
  end
end
