FactoryGirl.define do
  factory :building_relationship do
    entity { Faker::Name.last_name + %w(Engineers Lawyers Rocket-Surgeons).sample }
    relationship_name { Faker::Lorem.sentence }
    relationship_description { Faker::Lorem.paragraphs.join }
  end
end
