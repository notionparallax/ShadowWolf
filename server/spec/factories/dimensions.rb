FactoryGirl.define do
  factory :dimension do
    title { %w(GBA GFA NLA Height).sample }
    measurement   { (rand*100).floor*1000000 }
    standard_name { ["BC", "IOS", "RM"].sample +  ["USA", "Au", "UK"].sample}
    standard_version { "V"+(1..5).to_a.sample.to_s }
    unit { %w(m m² m³).sample }
    tags { ["main", %w(retail business residential).sample, %w(education health finance).sample] }
  end
end
