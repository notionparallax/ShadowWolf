# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :frequent_flier_program do
    name { Faker::Name.first_name + " air" }
    number { ((Faker::Internet.password + (0..9).to_a.join().to_s).split('')).shuffle[0..12].join }
  end
end
