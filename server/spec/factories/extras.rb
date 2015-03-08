FactoryGirl.define do
  factory :extra do
    label { %w(stairs beds walls).sample }
    quantity { [1,1000, 10000].sample }
  end
end
