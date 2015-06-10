FactoryGirl.define do
  factory :extra do
    label { %w(stairs beds walls).sample }
    quantity { [1,1000, 10000].sample }
    tags { ["main", %w(retail business residential).sample, %w(education health finance).sample] }
  end
end
