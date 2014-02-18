# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_source do
    referred_by { FactoryGirl.build( :referred_by ) }
    competition_win { [true,false].sample }
    competition_URL { 'http://' + Faker::Internet.domain_name + '/project-offers/' }
  end
end
