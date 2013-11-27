# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_contact do
    mobile { FactoryGirl.build( :employee_mobile ) }
    extension { [2,3,4,7].sample.to_s + Faker::Number.digit + Faker::Number.digit }
    studio { ['Brisbane', 'Sydney', 'Canberra', 'Auckland', 'Bangkok', 'London', 'Melbourne'].sample }
    work_email { Faker::Name.first_name + "_" + Faker::Name.last_name + "@bvn.com.au" }
  end
end
