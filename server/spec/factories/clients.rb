# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    main { Faker::name.name }
    direct { Faker::name.name  }
    end_user { Faker::name.name  }
  end
end
