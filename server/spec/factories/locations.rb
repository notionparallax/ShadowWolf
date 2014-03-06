# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    address { FactoryGirl.build( :address ) }
    geo_json { FactoryGirl.build( :geo_json ) }
  end
end
