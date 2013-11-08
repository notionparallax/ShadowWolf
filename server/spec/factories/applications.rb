# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application do
    date { (0..10).to_a.sample.years.ago + (1..345).to_a.sample.days }
    covering_letter { 'http://'+ Faker::Internet.domain_name + '/images/' + Faker::Number.number(20) + 'coverLetter.jpg' }
    portfolio { 'http://'+ Faker::Internet.domain_name + '/images/' + Faker::Number.number(20) + 'portfolio.jpg' }
    assessment { Faker::Lorem.paragraphs(paragraph_count = 2).join('<br>') }
    future_consideration { [true, false].sample }
    skills_and_keywords { ['Communication','Teamwork','Problem Solving','Initiative and Enterprise','Planning and Organising','Self-Management','Learning','Technology','detailing','big data','social media','Revit','Rendering','Python','Javascript','Welding'].sample(6).join(', ') }
  end
end
