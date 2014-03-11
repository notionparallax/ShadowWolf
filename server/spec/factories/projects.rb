# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    building { FactoryGirl.build( :building ) }
    non_building { FactoryGirl.build( :non_building ) }
    project_number { Date.strptime((0..20).to_a.sample.years.ago.to_s,"%Y-%m-%d %H:%M:%S %Z").strftime("%Y%m%d") + "." + (Faker::Base::ULetters.sample)+ (Faker::Base::ULetters.sample)+ (Faker::Base::ULetters.sample)}
    img { "http://notionparallax.co.uk/bldg/bld-" + (0..248).to_a.sample.to_s +".jpg" }
  end
end
