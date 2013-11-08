# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person_contact do
    social { FactoryGirl.build( :social ) }
    personal_email { Faker::Name.first_name+"."+Faker::Name.last_name+"@"+['gmail','yahoo','hotmail'].sample+".com" }
    personal_phone { '04' + Faker::Number.number(8) }
  end
end
