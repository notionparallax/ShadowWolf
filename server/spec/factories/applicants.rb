# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :applicant do
    after(:create) do |applicant|
      FactoryGirl.create_list( :application, 3, applicant: applicant )
    end
  end
end
