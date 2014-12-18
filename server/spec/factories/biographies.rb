# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biography do
    one_line_bio    { Faker::Lorem.paragraph               }
    approach        { Faker::Lorem.paragraphs.join('<br>') }
    expertise       { Faker::Lorem.paragraphs.join('<br>') }
    experience      { Faker::Lorem.paragraphs.join('<br>') }
    achievements    { Faker::Lorem.paragraphs.join('<br>') }
    value_statement { Faker::Lorem.paragraphs.join('<br>') }
  end
end
