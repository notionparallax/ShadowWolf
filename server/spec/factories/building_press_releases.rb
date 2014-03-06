# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building_press_release do
    date { (10..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    channel_list { Faker::Company.name + " " + "professional targetted marketing" }
    content { Faker::Lorem.paragraphs.join('<br>') }
    author_login { (Faker::Base::ULetters.sample + Faker::Name.last_name ).downcase }
  end
end
