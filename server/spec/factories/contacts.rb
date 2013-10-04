# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    mobile { FactoryGirl.build( :mobile ) }
    extension { Faker::Number.number(2).to_s }
    studio { %w(Sydney Melbourne Brisbane Antartica).sample }
  end
end
