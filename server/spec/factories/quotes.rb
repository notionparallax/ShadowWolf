# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quote do
    quote { Faker::Lorem.paragraphs.join('<br>') }
    date { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
    citation { Faker::Name.name  }
    context { Faker::Name.name  + " " + ["Review", "Times"].sample}
    tags { [%w(retail business residential).sample, %w(education health finance).sample] }
  end
end
