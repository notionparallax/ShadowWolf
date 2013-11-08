# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :finance do
    employee_code { (Faker::Internet.password + (0..9).to_a.join().to_s).split('').shuffle[0..8].join }
  end
end
