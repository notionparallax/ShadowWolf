# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biography do
    one_line_bio 		{ Faker::Lorem.sentence }
    your_approach 	{ Faker::Lorem.sentences.join('  ') }
    expertise 			{ Faker::Lorem.paragraph }
    key_experience 	{ Faker::Lorem.paragraph }
    achievements 		{ Faker::Lorem.paragraphs.join('\n') }
    value_statement { Faker::Lorem.sentence }
  end
end
