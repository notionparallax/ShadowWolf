# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
	after(:build) do |client|
      FactoryGirl.build_list( :referee, [0,1,2].sample, client: client )
    end
    main                     { Faker::Name.name }
    second_contracting_party { Faker::Name.name }
    direct                   { Faker::Name.name }
    end_user                 { Faker::Name.name }
  end
end
