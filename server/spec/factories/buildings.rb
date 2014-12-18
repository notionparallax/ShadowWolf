# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    after(:build) do |building|
      FactoryGirl.build_list( :quality_assurance, [0,1,2,3,10].sample, building: building )
    end
    after(:build) do |building|
      FactoryGirl.build_list( :building_press, [0,1,2,3,10].sample, building: building )
    end
    legacy { FactoryGirl.build( :legacy ) }
    after(:build) do |building|
      FactoryGirl.build_list( :phase, [0,1,2,3,10].sample, building: building )
    end
    after(:build) do |building|
      FactoryGirl.build_list( :dimension, [0,1,2,3,10].sample, building: building )
    end
    relationship_description { FactoryGirl.build( :relationship_description ) }
    client { FactoryGirl.build( :client ) }
    project_source { FactoryGirl.build( :project_source ) }
    after(:build) do |building|
      FactoryGirl.build_list( :location, [0,1,2,3,10].sample, building: building )
    end
    after(:build) do |building|
      FactoryGirl.build_list( :brief_element, [0,1,2,3,10].sample, building: building )
    end
    description { Faker::Lorem.paragraphs.join('<br>') }
    attribution { ["BVN","Donovan Hill","BVN Donovan Hill"].sample }
    BCA_classification { "Class " + ["1","1A","1B","2","3","4","5","6","7","8","9","9A","9B","9C","10","10A","10B"].sample }
    project_categories { [Faker::Name.first_name + ", "+Faker::Name.first_name + ", " + Faker::Name.first_name] }
    project_sub_catagories { [Faker::Name.first_name + ", "+Faker::Name.first_name + ", " + Faker::Name.first_name] }
    source_information_filepath { '/file/name.docx' }
  end
end
