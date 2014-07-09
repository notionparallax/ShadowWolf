# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :legacy do
    after(:build) do |legacy|
      FactoryGirl.build_list( :quote, [0,1,2,3,10].sample, legacy: legacy )
    end
    after(:build) do |legacy|
      FactoryGirl.build_list( :testimonial, [0,1,2,3,10].sample, legacy: legacy )
    end
    after(:build) do |legacy|
      FactoryGirl.build_list( :award, [0,1,2,3,10].sample, legacy: legacy )
    end
    photography { FactoryGirl.build( :photography ) }
    esd { FactoryGirl.build( :environmental_sustainable_design ) }
    one_line_grab { Faker::Lorem.paragraphs.join('<br>') }
    description_project_sheet { Faker::Lorem.paragraphs.join('<br>') }
    description_200_500_words { Faker::Lorem.paragraphs.join('<br>') }
    description_awards_style { Faker::Lorem.paragraphs.join('<br>') }
    innovation_client_style { Faker::Lorem.paragraphs.join('<br>') }
    interesting_things { Faker::Lorem.paragraphs.join('<br>') }
    brief_elements { Faker::Lorem.paragraphs.join('<br>') }
    security_level { ['Top Secret', 'Licence to Kill', 'Double Secret Probation', 'Baseline'].sample }
  end
end
