# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :geo_json do
    lat { (-155..110).to_a.sample + rand }
    lon { (-45..-10).to_a.sample + rand }
    boundary_points { [[(-155..110).to_a.sample + rand, (-45..-10).to_a.sample + rand],[(-155..110).to_a.sample + rand, (-45..-10).to_a.sample + rand],[(-155..110).to_a.sample + rand, (-45..-10).to_a.sample + rand],[(-155..110).to_a.sample + rand, (-45..-10).to_a.sample + rand]] }
  end
end
