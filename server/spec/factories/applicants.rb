# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :applicant do
    after(:build) do |applicant|
      FactoryGirl.build_list( :application, [0,1,2,3,10].sample, applicant: applicant )
    end
  end
end
