FactoryGirl.define do
  factory :brief_element do
    description { Faker::Lorem.words.join(' ') }
    tags { ["main", %w(retail business residential).sample, %w(education health finance).sample] }
  end
end
