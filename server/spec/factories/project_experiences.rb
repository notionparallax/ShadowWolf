# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_experience do
    start_date { (0..10).to_a.sample.years.ago + (1..345).to_a.sample.days }
    end_date { (0..10).to_a.sample.years.ago + (1..345).to_a.sample.days }
    name { Faker::Name.last_name + ' ' + ['building', 'centre', 'tower'].sample }
    firm { Faker::Name.first_name + ", "+Faker::Name.first_name + " and "+Faker::Name.first_name }
    role { ['Producer', 'Executive Producer', 'Production Manager', 'Production Assistant', 'Screenwriter', 'Stunt Coordinator', 'Director', 'Location Scout', 'System administrator'].sample }
    stage { ['Pre Design Services', 'Concept Design', 'Design Development', 'Approval Documents', 'Post DA Lodgment Services', 'Construction Approval', 'Construction Documentation', 'Tendering & Builder Appointment', 'Construction Period Services'].sample }
    url { 'http://'+ Faker::Internet.domain_name + '/projects/'+ Faker::Name.first_name + 'projects/' }
  end
end
