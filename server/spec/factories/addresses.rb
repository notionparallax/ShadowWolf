# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    dirty_location { "<p>West End, Brisbane QLD</p>"}
    building_name { Faker::Name.first_name + " Building"}
    street_number { Faker::Address.building_number }
    street { Faker::Address.street_name + " " + Faker::Address.street_suffix}
    suburb_area { ["Eagle Vale", "Earlwood", "East Gordon", "East Hills", "East Killara", "East Lindfield", "East Ryde", "East Sydney", "Eastern Creek", "Eastgardens", "Eastlakes", "Eastwood", "Edensor Park", "Edgecliff", "Edmondson Park", "Elanora Heights", "Elderslie", "Elizabeth Bay", "Ellis Lane", "Elvina Bay", "Emerton", "Emu Heights", "Emu Plains", "Enfield", "Engadine", "Englorie Park", "Enmore", "Epping", "Ermington", "Erskine Park", "Erskineville", "Eschol Park", "Eveleigh"].sample}
    state_county { ["Ashmore and Cartier Islands","Australian Antarctic Territory","Australian Capital Territory","Christmas Island  Christmas Island","Cocos (Keeling) Islands  Cocos (Keeling) Islands","Coral Sea Islands","Heard Island and McDonald Islands","Jervis Bay Territory","New South Wales","Norfolk Island","Northern Territory","Queensland  Queensland","South Australia","Tasmania","Victoria","Western Australia"].sample }
    country {  Faker::Address.country }
    postcode { Faker::Address.postcode}
  end
end
