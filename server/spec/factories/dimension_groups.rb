# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dimension_group do
    nla { FactoryGirl.build( :net_lettable_area ) }
    gfa { FactoryGirl.build( :gross_floor_area ) }
    gba { FactoryGirl.build( :gross_building_area ) }
    footprint_area { FactoryGirl.build( :footprint_area ) }
    height { FactoryGirl.build( :height ) }
    dirty_size "one thousand metres squared"
  end
end
