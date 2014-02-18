# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    after(:build) do |building|
      FactoryGirl.build_list( :quality_assurance, [0,1,2,3,10].sample, building: building )
    end
    building_press { FactoryGirl.build( :building_press ) }
    legacy { FactoryGirl.build( :legacy ) }
    phase { FactoryGirl.build( :phase ) }
    relationship_description { FactoryGirl.build( :relationship_description ) }
    client { FactoryGirl.build( :client ) }
    dims { FactoryGirl.build( :dimension_group ) }
    project_source { FactoryGirl.build( :project_source ) }
    location { FactoryGirl.build( :location ) }
    description { Faker::Lorem.paragraphs.join('<br>') }
    attribution { "TODO: I don't remember why this field  exists" }
    BCA_classification { "Class " + ["1","1A","1B","2","3","4","5","6","7","8","9","9A","9B","9C","10","10A","10B"].sample }
    project_catagories { Faker::Name.first_name + ", "+Faker::Name.first_name + ", " + Faker::Name.first_name }
    project_sub_catagories { Faker::Name.first_name + ", "+Faker::Name.first_name + ", " + Faker::Name.first_name }
  end
end
