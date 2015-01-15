FactoryGirl.define do
  factory :press_release do
	    title { Faker::Company.catch_phrase }
	    date  { (0..20).to_a.sample.years.ago + (1..345).to_a.sample.days }
	    body  { Faker::Lorem.paragraphs.join('<br>') }
    end
end
